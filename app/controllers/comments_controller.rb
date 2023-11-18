class CommentsController < ApplicationController
  before_action :set_post
  skip_before_action :verify_authenticity_token, only: [:create]
  load_and_authorize_resource
  def index
    @post = Post.find(params[:post_id].to_i)
    @posts_comments = @post.comments
    respond_to do |format|
      format.json { render json: @posts_comments }
    end
  end

  def new
    @user = User.where(email: session[:user]['email']).first
    @comment = @user.posts[params[:post_id].to_i - 1].comments.new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      comment_params = params.require(:comment).permit(:text)
      @comment = Comment.new(comment_params.merge(user: @user, post_id: params[:post_id]))

      respond_to do |format|
        if @comment.save
          format.html do
            redirect_to "/users/#{params[:user_id]}/posts/#{params[:comment][:url_id]}",
                        flash: { success: 'Comment was successfully created.' }
          end
          format.json { render json: { token:, comment: @comment }, status: :ok }
        else
          format.html do
            redirect_to "/users/#{params[:user_id]}/posts/#{params[:comment][:url_id]}",
                        flash: { wrong: 'Upps! Comment was not created.' }
          end
          format.json do
            render json: { error: 'Failed to create comment', errors: @comment.errors.full_messages },
                   status: :unprocessable_entity
          end
        end
      end
    else
      respond_to do |format|
        format.html do
          redirect_to new_user_session_path, flash: { error: 'Unauthorized' }
        end
        format.json { render json: { error: 'Unauthorized' }, status: :unauthorized }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_item].to_i)
    @post = Post.find(@comment.post_id)
    authorize! :destroy, @comment
    @comment.destroy
    @post.decrement!(:comments_counter)
    redirect_to "/users/#{session[:user]['id']}/posts/@post.id", notice: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user, :post_id)
  end
end

class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.where(email: session[:user]['email']).first
    @comment = @user.posts[params[:post_id].to_i - 1].comments.new
  end

  def create
    authorize! :create, @comment
    @user = User.where(email: session[:user]['email']).first
    @comment = Comment.create(text: params[:comment][:text], user: @user, post_id: params[:post_id])
    if @comment.new_record?
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:comment][:url_id]}",
                  flash: { wrong: 'Upps! Comment was not created.' }
    else
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:comment][:url_id]}",
                  flash: { success: 'Comment was successfully created.' }
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

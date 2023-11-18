class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.where(email: session[:user]['email']).first
    @user_posts = Post.includes(:author).where(author_id: @user.id)
  end

  def show
    @id = params[:id]
    @user = User.where(email: session[:user]['email']).first
    @post_item = Post.find(params[:id])
    @comment = @post_item.comments.new
  end

  def new
    @user = User.where(email: session[:user]['email']).first
    @post = @user.posts.new
  end

  def create
    authorize! :create, @post
    puts params.inspect
    @user = User.where(email: session[:user]['email']).first
    @post = Post.create(author: @user, title: params[:post][:title], text: params[:post][:text],
                        comments_counter: 0, likes_counter: 0)
    if @post.new_record?
      redirect_to "/users/#{@user.id}/posts/new", flash: { wrong: 'Upps! Post was not created.' }
    else
      redirect_to "/users/#{@user.id}/posts/new", flash: { success: 'Post was successfully created.' }
    end
  end

  def destroy
    @post = Post.find(params[:post_item_id].to_i)
    @author = User.find(@post.author_id.to_i)
    authorize! :destroy, @post
    Like.where(post: @post).destroy_all
    Comment.where(post: @post).destroy_all
    @post.destroy
    @author.decrement!(:posts_counter)
    redirect_to "/users/#{session[:user]['id']}/", notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :text)
  end
end

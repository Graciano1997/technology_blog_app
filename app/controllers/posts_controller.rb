class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.includes(:author).where(author_id: @user.id)
  end

  def show
    @id = params[:id]
    @user = User.find(params[:user_id])
    @post_item = Post.includes(:author).where(author: @user, posts: { id: params[:id] }).first
    @comment = @user.posts[params[:post_id].to_i - 1].comments.new
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @post = Post.create(author: current_user, title: params[:post][:title], text: params[:post][:text],
                        comments_counter: 0, likes_counter: 0)
    if @post.new_record?
      redirect_to '/users/1/posts/new', flash: { wrong: 'Upps! Post was not created.' }
    else
      redirect_to '/users/1/posts/new', flash: { success: 'Post was successfully created.' }
    end
  end
end
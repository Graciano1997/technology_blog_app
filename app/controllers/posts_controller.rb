class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: params[:user_id]).all
  end

  def show
    @id = params[:id]
    @user = User.find(params[:user_id])
    @post_item = Post.where(author_id: @user.id)[params[:id].to_i - 1] if params[:id].to_i
  end
end

class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at')
    render json: { success: true, data: { posts: @posts } }, status: :ok
  end
end
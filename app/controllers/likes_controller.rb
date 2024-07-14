class LikesController < ApplicationController
  def create
    @user = User.where(email: session[:user]['email']).first
    @post_item = Post.find(params[:post_id].to_i)
    @posts_like = @post_item.likes
    @zero = @post_item.likes.where(user_id: @user.id).count.zero? unless @posts_like.nil?
    @like = Like.create(user: @user, post: @post_item) if @zero
  end
end

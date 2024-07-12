class LikesController < ApplicationController
  def create
    @user = User.where(email: session[:user]['email']).first

    @zero = @user.posts[(params[:post_item_id].to_i - 1)].likes.where(user_id: @user.id).count.zero?
    @like = Like.create(user: @user, post_id: params[:post_item_id]) if @zero
  end
end

class LikesController < ApplicationController
  def create
    @user = User.where(email: session[:user_email]).first
  end
end

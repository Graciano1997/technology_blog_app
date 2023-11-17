class LikesController < ApplicationController
  def create
    @user = User.where(email: session[:email]).first
  end
end

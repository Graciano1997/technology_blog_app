class PostsController < ApplicationController
  def index
    @id=params[:user_id]
  end

  def show
    @user_id=params[:user_id]
    @id=params[:id]
  end
end
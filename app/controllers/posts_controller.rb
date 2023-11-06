class PostsController < ApplicationController
  def index
    @id=params[:user_id]
  end
end
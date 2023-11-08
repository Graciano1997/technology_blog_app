class PostsController < ApplicationController
  def index
    @posts=Post.where(author_id: params[:id])
    @user=User.find(params[:user_id])
  end

  def show
    @id=params[:id]
    @user=User.find(params[:user_id])
    @post_item=Post.where(author_id: @user.id)[params[:id].to_i - 1] if params[:id].to_i
  end
end

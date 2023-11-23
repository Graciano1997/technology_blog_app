class Api::V1::CommentsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  after_action :hard_logout
  before_action :authenticate_request
  skip_authorization_check only: [:create]

  def index
    @comments = User.find(params[:user_id]).posts.find(params[:post_id]).comments
    render json: { success: true, data: { comments: @comments } }
  end

  def create
    authorize! :create, @comment
    @current_user = User.where(email: session[:user]['email']).first
    @post = User.find(params[:user_id]).posts.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:text], user: @current_user)

    if @comment.save
      render json: { success: true, data: { comment: @comment } }, status: :created
    else
      render json: { success: false, errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

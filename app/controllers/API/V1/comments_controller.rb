class Api::V1::CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    load_and_authorize_resource
  
    def index
      @post = Post.includes(:comments).find(params[:post_id])
      @comments = @post.comments
      render json: { success: true, data: { comments: @comments } }
    end
  
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(text: params[:text], user_id: current_user.id)
  
      if @comment.save
        render json: { success: true, data: { comment: @comment, user: current_user } }, status: :created
      else
        render json: { success: false, errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
    def params
      params.require(:comment).permit(:text)
    end 
end

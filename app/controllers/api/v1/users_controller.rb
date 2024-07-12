module Api
  module V1
    class PostsController < ApplicationController
      load_and_authorize_resource

      def index
        @user = User.find(params[:user_id])
        @posts = @user.posts.order('created_at')
        render json: { success: true, data: { posts: @posts } }, status: :ok
      end
    end
  end
end

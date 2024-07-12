module Api
  module V1
    class PostsController < ApplicationController
      load_and_authorize_resource
      skip_before_action :authenticate_user!
      before_action :authenticate_request
      after_action :hard_logout

      def index
        @posts = User.find(params[:user_id]).posts.order('created_at')
        render json: { success: true, data: { posts: @posts } }, status: :ok
      end
    end
  end
end

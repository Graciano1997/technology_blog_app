class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: %i[show destroy] # corrected 'brefore_action' to 'before_action'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id].to_i)
  end

  def logout
    reset_session
    redirect_to new_user_session_path, notice: 'Logged out successfully.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :name, :password, :posts_counter) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :name, :password, :current_password) }
  end

  def after_sign_in_path_for(resource)
    User.where(email: resource.email).first
    session[:user] = @user
    root_path
  end

  private

  def authenticate_request
    auth_header = request.headers['Authorization']
    return unless auth_header

    token = auth_header.split.last
    decoded = TokenService.decode(token)
    @user = User.where(email: decoded[:email]).first
    session[:user] = @user
  end

  def hard_logout
    reset_session
    puts 'Request executed successfully.....100%'
  end
end

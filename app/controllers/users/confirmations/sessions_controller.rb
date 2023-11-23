class Users::Confirmations::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # super
    super do |user|
      if user.persisted?
        payload = { email: user.email }
        token = TokenService.encode(payload)
        puts "User #{user.name} token: #{token} "
        puts 'please save the above token!'
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # private

  # def generate_token(user)
  #   payload = { email: user.email, password: user.password }
  #   JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  # end
end

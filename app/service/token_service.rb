class TokenService
  # SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.encode(payload)
    JWT.encode(payload, 'secret')
  end

  def self.decode(token)
    decoded = JWT.decode(token, 'secret', true, algorithm: 'HS256')[0]
    decoded_hash = HashWithIndifferentAccess.new(decoded)
    Rails.logger.info("Decoded data: #{decoded_hash}")
    decoded_hash
  rescue JWT::DecodeError
    { error: 'Invalid token' }
  end
end

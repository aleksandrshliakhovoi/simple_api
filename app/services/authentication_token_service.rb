class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'
  ALGO_TYPE = 'HS256'

  def self.call(user_id)
    payload = { user_id: user_id }

    JWT.encode payload, HMAC_SECRET, ALGO_TYPE
  end

  def self.decode(token)
    decoded_token = JWT.decode token, HMAC_SECRET, true, { algorith: ALGORITHM_TYPE }
    decoded_token[0]['user_id']
  end
end

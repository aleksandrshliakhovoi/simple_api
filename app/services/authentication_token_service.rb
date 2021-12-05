class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'
  ALGO_TYPE = 'HS256'

  def self.call
    payload = {'test' => '123'}

    JWT.encode payload, HMAC_SECRET, ALGO_TYPE
  end
end

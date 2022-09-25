# create a JsonWebToken
class JsonWebToken
  SECRET_KEY = '123456'.freeze

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    bearer_token = token.split(' ')
    JWT.decode(bearer_token.last, SECRET_KEY)
  end
end

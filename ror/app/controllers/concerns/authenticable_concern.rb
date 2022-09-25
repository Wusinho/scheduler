module AuthenticableConcern
  extend ActiveSupport::Concern

  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return if header.nil?

    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded.first['id'])
  end

  protected

  def check_login
    head :forbidden unless current_user
  end

  def check_owner

  end

end

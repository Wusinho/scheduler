class ApplicationController < ActionController::API
  include AuthenticableConcern

  def current_user_org
    return unless @current_user

    @current_user.organization
  end


end

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    return redirect_to '/' unless session[:userinfo].present?

    @user = session[:userinfo]
  end
end

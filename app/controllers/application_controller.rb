class ApplicationController < ActionController::Base
  include Authentication
  include Sq::SSO::Auth

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_sso
  before_filter :find_current_user
end

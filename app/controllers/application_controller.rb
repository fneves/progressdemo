class ApplicationController < ActionController::Base
  before_filter :authenticate, :except => [:index, :show]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_breadcrumb  'home', :root_path

  def login
    redirect_to root_path
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == USER_ID && password == PASSWORD
    end
  end
end

class Admin::AdminController < ApplicationController
  layout "admin"

  helper_method :current_administrator
  helper_method :authenticate_administrator
  helper_method :redirect_back_or
  helper_method :store_location

  private

   def current_administrator
     @current_administrator ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
   end

   def authenticate_administrator
    redirect_to admin_log_in_path,
    alert: "you have to log in" if current_administrator.nil?
   end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

end

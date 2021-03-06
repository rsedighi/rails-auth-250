class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?

private

   def current_user
    @current_user ||= User.find(session[:user_id]) if sessions[:user_id]
   end
   helper_method :current_user
end

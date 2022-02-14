class ApplicationController < ActionController::Base
  helper_method :current_admin, :logged_in?
  
  def current_admin
    @current_admin ||= Admin.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_admin
  end

  def require_admin
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end

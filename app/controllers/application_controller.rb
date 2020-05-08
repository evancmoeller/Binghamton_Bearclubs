class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :can_proceed
  helper_method :current_user, :logged_in?
  
  protected
  
  def can_proceed
    # redirect_to welcome_login_path and return unless current_user # development only
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  helper_method :hide
  def hide 
    "invisible" if @header == 'hide'
  end
  
  helper_method :admin_only
  def admin_only 
    user = current_user
    "admin_only" if user.acct_type != 'Admin'
  end
  
end

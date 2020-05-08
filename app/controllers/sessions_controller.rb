class SessionsController < ApplicationController
  
  skip_before_filter :can_proceed
  
  class DoubleLoginError < ArgumentError ; end
  class NotCurrentUserError < ArgumentError ; end
  class InvalidEmailError < ArgumentError ; end
    
  def new
  end

  def create
    begin 
      if session?
        if same_as_logged_in_user? auth_hash['info']
          raise DoubleLoginError, "You are already logged in."
        else 
          raise NotCurrentUserError, "You are not that user."
        end
      else  
        if Authorization.exists?(auth_hash)
          auth = Authorization.find_with_omniauth(auth_hash)
          message = "Welcome back #{auth.user.name}!"
          session[:user_id] = auth.user.id
          self.current_user = auth.user
          flash[:notice] = "#{message}"
          redirect_to dashboard_index_path and return
        else 
          user = User.create_with_omniauth(auth_hash['info'])
          
          if user.email.split('@')[1] == 'binghamton.edu' 
            auth = Authorization.create_with_omniauth(auth_hash)
            auth.update_attributes(user_id: user.attributes["id"])
            message = "Welcome #{auth.user.name}! You've signed up using #{auth.provider.capitalize}. Please complete your account by filling out this form."
            session[:user_id] = auth.user.id
            self.current_user = auth.user
            flash[:notice] = "#{message}"
            redirect_to edit_user_path(user) and return
          else
            raise InvalidEmailError, "Please use a valid '@binghamton.edu' email address."
          end
        end
      end
    rescue DoubleLoginError, NotCurrentUserError, InvalidEmailError, Exception => exception
      flash[:error] = "#{exception.message}"
      redirect_to auth_failure_path
    end
  end

  def destroy
    message = "You successfully logged out of your account."
    self.current_user = nil
    session.delete(:user_id)
    reset_session
    flash[:notice] = message
    redirect_to welcome_login_path
  end
  
  def failure
    @header = 'hide'
    begin
    rescue Exception => exception
      flash[:error] = "#{exception.message}"
      redirect_to welcome_login_path
    end    
  end
  
  def cleanup
    reset_session
    flash[:warning] = "Session Reset" 
    redirect_to welcome_login_path
  end
  
  private

  def auth_hash
    @auth_hash ||= request.env['omniauth.auth']   
  end 
  
  def session?
    !!session[:user_id]
  end
  
  def same_as_logged_in_user? info
    user = User.find(session[:user_id]) 
    user.name == info['name'] && user.email == info['email']
  end 
end

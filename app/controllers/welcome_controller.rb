class WelcomeController < ApplicationController
  skip_before_filter :can_proceed
  
  def login
    # reset if something breaks
    # reset_session
    # flash[:warning] = "Session Reset (for testing ONLY) " 
    @action = 'login'
  end
  
  def signup
    @action = 'signup'
  end
end

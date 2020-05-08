class WelcomeController < ApplicationController
  skip_before_filter :can_proceed
  
  def login
    @header = 'hide'
  end
end

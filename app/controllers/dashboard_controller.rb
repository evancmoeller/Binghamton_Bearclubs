class DashboardController < ApplicationController
  def index
    @user = current_user
    @clubs = []
    @temp = @user.joined.to_s
    if @temp.length > 0
      @clubs = @temp.split('.').map(&:to_i)
    end
  end
  
  helper_method :hide_message
  def hide_message 
    "hide_message" if @clubs.length >= 1
  end
  
end

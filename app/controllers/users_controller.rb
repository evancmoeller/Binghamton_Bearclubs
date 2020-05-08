class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:b_number, :acct_type, :major, :grad_year, :joined => "")
  end
  
  def show
    @user = User.find params[:id]
  end
  
  def edit
    @user = User.find params[:id]
    @header = 'hide'
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "You successfully updated your account."
    redirect_to dashboard_index_path
  end
  
end

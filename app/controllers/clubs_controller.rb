class ClubsController < ApplicationController
  def club_params
    params.require(:club).permit(:name, :description)
  end
  
  def index
    @clubs = Club.all
  end
  
  def new
    
  end
  
  def create
    @club = Club.create!(club_params)
    flash[:notice] = "'#{@club.name}' was created."
    redirect_to clubs_path
  end
  
  def destroy
    @club = Club.find params[:id]
    @club.destroy
    flash[:notice] = "'#{@club.name}' was deleted."
    redirect_to clubs_path
  end
  
  def edit
    @club = Club.find params[:id]
  end
  
  def update
    @club = Club.find params[:id]
    @club.update_attributes!(club_params)
    flash[:notice] = "'#{@club.name}' was updated."
    redirect_to clubs_path
  end
  
  def show
    id = params[:id]
    @club = Club.find(id)
  end
  
  def temp
  
  end
end

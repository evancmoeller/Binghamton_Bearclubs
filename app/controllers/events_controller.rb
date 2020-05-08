class EventsController < ApplicationController
  
  before_filter :find_club
  
  def find_club
    @club = Club.find(params[:club_id])
  end
  
  def event_params
    params.require(:event).permit(:name, :description, :date_time, :location)
  end
  
  def index
    @events = Event.where("club_id = ?", params[:club_id])
  end
  
  def new
    @club = Club.find(params[:club_id])
  end
  
  def create
    #New code from session with professor
    ######################################
    #@club = Club.find(params[:club_id])
    #@event = @club.events.build(params[:event])
    
    #auth = Authorization.create_with_omniauth(auth_hash)
    #auth.update_attributes(user_id: user.attributes["id"])
    ######################################
    
    @event = @club.events.create!(event_params)
    
    #New code from session with professor
    ######################################
    #@event = Event.create!(event_params)
    #@event.update_attributes(club_id: @club.attributes["id"])
    ######################################
    
    flash[:notice] = "You successfully created #{@event.name}."
    redirect_to club_events_path
  end
  
  def destroy
    @event = Event.find params[:id]
    @event.destroy
    flash[:notice] = "You successfully deleted #{@event.name}."
    redirect_to club_events_path
  end
  
  def edit
    @event = Event.find params[:id]
  end
  
  def update
    @event = Event.find params[:id]
    @event.update_attributes!(event_params)
    flash[:notice] = "You successfully updated #{@event.name}."
    redirect_to club_events_path
  end
  
  def show
    id = params[:id]
    @event = Event.find(id)
  end
  
end

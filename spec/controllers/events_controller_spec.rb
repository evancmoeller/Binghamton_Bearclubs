require 'rails_helper'

describe EventsController, type: :controller do
  describe '#create' do
    let(:id1) {"1"}
    let(:club_params) {{name: 'test_club'}} 
    let(:club) {instance_double('Club', club_params)}
    
    let(:event_params) {{name: 'test_event'}}
    let(:event) {instance_double('Event', event_params)}
    it 'creates the new event' do
        # @event = @club.events.create!(event_params)
        
        # auth = Authorization.create_with_omniauth(auth_hash)
        # auth.update_attributes(user_id: user.attributes["id"])
        
        # allow(Club).to receive(:find).with(id1).and_return(club)
        # expect(Event).to receive(:create!).with({name: 'test_event'}).and_return(event)
        # post :create, { :event => event_params, :club_id => id1 }
    end
    
    it 'sends a flash message' do
        # allow(Event).to receive(:create!).with(event_params).and_return(event)
        # post :create, event: event_params
        # expect(flash[:notice]).to match(/[^']* was created.$/)
    end
    it 'redirect_to events page' do
        # allow(Event).to receive(:create!).with(event_params).and_return(event)
        # post :create, event: event_params
        # expect(response).to redirect_to club_events_path(club)
    end
  end
  
  describe '#show' do
    it 'retrieves the event' do
    end
  end
  
  describe '#edit' do
    it 'retrieves the event' do
    end
  end
  
  describe '#update' do
    it 'retrieves the event' do
    end
    it 'updates the event attributes' do
    end
    it 'sends a flash message' do
    end
    it 'redirect_to event index' do
    end
  end
  
  describe '#destroy' do
    it 'retrieves the event' do  
    end
    it 'calls the destroy method' do
    end
    it 'sends a flash message' do
    end
    it 'redirect_to event index' do
    end
  end
end
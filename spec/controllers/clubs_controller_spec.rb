require 'rails_helper'

describe ClubsController, type: :controller do
  describe '#create' do
      let(:params) {{name: 'test'}} 
      let(:club) {instance_double('Club', params)}
      it 'creates the new club' do
          expect(Club).to receive(:create!).with(params).and_return(club)
          post :create, club: params
      end
      it 'sends a flash message' do
          allow(Club).to receive(:create!).with(params).and_return(club)
          post :create, club: params
          expect(flash[:notice]).to match(/^\'[^']*\' was created.$/) 
      end
      it 'redirect_to clubs index' do
          allow(Club).to receive(:create!).with(params).and_return(club)
          post :create, club: params
          expect(response).to redirect_to clubs_path
      end
  end
  
  describe '#destroy' do
      let(:id1) {"1"}
      let(:club) {instance_double('Club', name: "temp")}
      it 'retrieves the club' do
         expect(Club).to receive(:find).with(id1).and_return(club)
         allow(club).to receive(:destroy)
         delete :destroy, :id => id1
      end
      it 'calls the destroy method' do
         allow(Club).to receive(:find).with(id1).and_return(club)
         expect(club).to receive(:destroy)
         delete :destroy, :id => id1
      end
      it 'sends a flash message' do
         allow(Club).to receive(:find).with(id1).and_return(club)
         allow(club).to receive(:destroy)
         delete :destroy, :id => id1
         expect(flash[:notice]).to match(/^\'[^']*\' was deleted.$/)
      end
      it 'redirect_to clubs index' do
         allow(Club).to receive(:find).with(id1).and_return(club)
         allow(club).to receive(:destroy)
         delete :destroy, :id => id1
         expect(response).to redirect_to clubs_path
      end
  end
end
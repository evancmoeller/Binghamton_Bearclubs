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
  
  describe '#show' do
    let(:id1) {"1"}
    let(:club) {instance_double('Club', name: "temp")}
    it 'retrieves the club' do
      expect(Club).to receive(:find).with(id1).and_return(club)
      get :show, :id => id1
    end
  end
  
  describe '#edit' do
      let(:id1) {"1"}
      let(:club) {instance_double('Club', name: "temp")}
      it 'retrieves the club' do
         expect(Club).to receive(:find).with(id1).and_return(club)
         get :edit, :id => id1
      end
  end
  
  describe '#update' do
    let(:id1) {"1"}
    let(:params) {{:name => "test"}}
    let(:club) {instance_double('Club', name: "temp")}
    let(:updated) {instance_double('Club', name: "test")}
    it 'retrieves the club' do
      expect(Club).to receive(:find).with(id1).and_return(club)
      allow(club).to receive(:update_attributes!).with(params)
      put :update, :id => id1, club: params
    end
    it 'updates the club attributes' do
      allow(Club).to receive(:find).with(id1).and_return(club)
      expect(club).to receive(:update_attributes!).with(params)
      put :update, :id => id1, club: params
      #expect(assigns(:club)).to eq(updated)
    end
    it 'sends a flash message' do
         allow(Club).to receive(:find).with(id1).and_return(club)
         allow(club).to receive(:update_attributes!).with(params)
         put :update, :id => id1, club: params
         expect(flash[:notice]).to match(/^\'[^']*\' was updated.$/)
    end
    it 'redirect_to clubs index' do
         allow(Club).to receive(:find).with(id1).and_return(club)
         allow(club).to receive(:update_attributes!).with(params)
         put :update, :id => id1, club: params
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
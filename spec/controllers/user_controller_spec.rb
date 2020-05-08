require 'rails_helper'

describe UsersController, type: :controller do
  
  describe '#show' do
    let(:id1) {"1"}
    let(:user) {instance_double('User', name: "Baxter Bearcat")}
    it 'retrieves the user' do
      expect(User).to receive(:find).with(id1).and_return(user)
      get :show, :id => id1
    end
  end
  
  describe '#edit' do
    let(:id1) {"1"}
    let(:user) {instance_double('User', name: "Baxter Bearcat")}
    it 'retrieves the user' do
      expect(User).to receive(:find).with(id1).and_return(user)
      get :show, :id => id1
    end
  end
  
  describe '#update' do
    let(:id1) {"1"}
    let(:user_params) {{:b_number => "B00123456"}}
    let(:user) {instance_double('User', b_number: "B00112233")}
    let(:updated_user) {instance_double('User', b_number: "B00123456")}
    it 'retrieves the user' do
      expect(User).to receive(:find).with(id1).and_return(user)
      allow(user).to receive(:update_attributes!).with(user_params)
      put :update, id: id1, user: user_params
    end
    it 'updates the user attributes' do
      allow(User).to receive(:find).with(id1).and_return(user)
      expect(user).to receive(:update_attributes!).with(user_params)
      put :update, :id => id1, user: user_params
    end
    it 'sends a flash message' do
       allow(User).to receive(:find).with(id1).and_return(user)
       allow(user).to receive(:update_attributes!).with(user_params)
       put :update, :id => id1, user: user_params
       expect(flash[:notice]).to match(/You successfully updated your account.$/)
    end
    it 'redirect_to users index' do
       allow(User).to receive(:find).with(id1).and_return(user)
       allow(user).to receive(:update_attributes!).with(user_params)
       put :update, :id => id1, user: user_params
       expect(response).to redirect_to dashboard_index_path
    end
  end
end

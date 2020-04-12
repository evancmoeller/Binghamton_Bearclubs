require 'rails_helper'

describe ClubsController do
  describe 'create a new club', :type => :controller do
      let(:params) {{name: 'test', description: 'blah, blah, blah...', admins: 'none'}} 
      let(:club1) {double('Club', params)}
      it 'creates the new club' do
          expect(Club).to receive(:create!).with(params).and_return(club1)
          post :create, club1: params
      end
  end
end
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end
  
  describe "#create" do
    context "no active sessions" do
      before do
        session[:user_id] = {}
      end
      it "checks there is no active session" do
        expect(controller).to receive(:session?).and_return(false)
        post :create, provider: :github
      end
      
      describe "authorization does not exists and user does not exists" do
        context "authorization does not exist" do
          it "checks no authorization exists" do 
            allow(controller).to receive(:session?).and_return(false)
            expect(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false) 
            post :create, provider: :github
          end
          
          context "user does not exist" do
            it "checks no user exists" do 
              # allow(controller).to receive(:session?).and_return(false)
              # allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
              # expect(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
              # post :create, provider: :github
            end
            
            context "user registers with given provider" do
              let(:user) { instance_double('User', name: 'Baxter Bearcat', email: 'bbearcat1@binghamton.edu') }
              let(:auth) { instance_double('Authorization', provider: 'GitHub', uid: '12345678') }
              let(:auth_with_id) { instance_double('Authorization', provider: 'GitHub', uid: '12345678', user_id: 1) }
              
              it "checks user registers with given provider" do
                allow(controller).to receive(:session?).and_return(false)
                allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
                allow(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
                expect(User).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]['info']).and_return(user)
                post :create, provider: :github
              end
              
              it "create authorization for user" do
                allow(controller).to receive(:session?).and_return(false)
                allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
                allow(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
                allow(User).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]['info']).and_return(user)
                expect(Authorization).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]).and_return(auth)
                post :create, provider: :github
              end
            end
          end
        end
      end
    end
  end
end

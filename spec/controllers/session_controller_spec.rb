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
              allow(controller).to receive(:session?).and_return(false)
              allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
              expect(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
              post :create, provider: :github
            end
            
            context "user registers with given provider" do
              it "checks user registers with given provider" do
                allow(controller).to receive(:session?).and_return(false)
                allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
                allow(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
                expect(User).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
                post :create, provider: :github
              end
            end
          end
        end
      end
      
      describe "authorization exists and user exists" do
        context "authorization exists" do
          it "checks authorization exists" do 
            allow(controller).to receive(:session?).and_return(false)
            expect(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(true) 
            post :create, provider: :github
          end
          
          context "user exists" do
            it "checks user exists" do 
              allow(controller).to receive(:session?).and_return(false)
              allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(true)
              #expect(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(true)
              post :create, provider: :github
            end
            
            context "user logs in with given provider" do
              it "checks user logs in with given provider" do
                allow(controller).to receive(:session?).and_return(true)
                #allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(true)
                #allow(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(true)
                post :create, provider: :github
              end
            end
          end
        end
      end
    end
  end
end

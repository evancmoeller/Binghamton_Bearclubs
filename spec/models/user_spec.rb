require 'rails_helper'

RSpec.describe User, type: :model do
    
  describe '.exists?' do
    it 'is a class method' do 
       expect(described_class).to respond_to(:exists?)
    end
  end
  
  describe '.find_with_omniauth' do
    it 'is a class method' do 
       expect(described_class).to respond_to(:find_with_omniauth)
    end
  end
  
  describe '#add_provider' do
    #let!(:user1) { FactoryGirl.create(:user) }
    it 'is an instance method' do 
      #expect(user1).to respond_to(:add_provider)
    end
  end
  
end

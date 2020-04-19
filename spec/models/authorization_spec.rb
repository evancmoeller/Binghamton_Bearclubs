require 'rails_helper'

RSpec.describe Authorization, type: :model do

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
  
  describe '.create_with_omniauth' do
    it 'is a class method' do 
       expect(described_class).to respond_to(:create_with_omniauth)
    end
  end
end

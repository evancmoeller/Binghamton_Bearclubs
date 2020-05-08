require 'rails_helper'

RSpec.describe Club, type: :model do
  
  let(:HackBU) {instance_double('Club', {:name => 'HackBU', :category => 'Academic', :subcategory => 'CS & Engineering'})}
  let(:CircleK) {instance_double('Club', {:name => 'Circle K', :category => 'Activism', :subcategory => 'Community Service & Philanthropy'})}
  let(:FinanceSociety) {instance_double('Club', {:name => 'Finance Society', :category => 'Academic', :subcategory => 'Economics & Business'})}
  
  describe '.not_found?' do
    it 'is a class method' do 
       expect(described_class).to respond_to(:not_found?)
    end
    context 'search (match)' do 
      it 'returns one club' do
        allow(Club).to receive(:where).with(name: 'HackBU').and_return(true)
      end
    end
    context 'search (no match)' do 
      it 'returns no clubs' do
        allow(Club).to receive(:where).with(name: 'HackNYU').and_return(false)
      end
    end
  end
  
  describe '.search_by' do
    it 'is a class method' do 
       expect(described_class).to respond_to(:search_by)
    end
    context 'search for club' do 
      it 'returns one club' do
        allow(Club).to receive(:where).with(name: 'HackBU').and_return(:HackBU)
      end
    end
  end
  
  describe '.with_categories' do
    it 'is a class method' do 
       expect(described_class).to respond_to(:with_categories)
    end
    context 'filter by single subcategory' do 
      it 'returns one club' do
        allow(Club).to receive(:where).with(subcategory: 'Economics & Business').and_return(:FinanceSociety)
      end
    end
    context 'filter by multiple subcategories' do 
      it 'returns multiple clubs' do
        allow(Club).to receive(:where).with(subcategory: ['CS & Engineering', 'Economics & Business']).and_return(:FinanceSociety, :HackBU)
      end
    end
  end
end

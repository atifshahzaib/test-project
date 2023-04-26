# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many_attached(:images) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:description).is_at_least(10).is_at_most(250) }
    it { should validate_presence_of(:price) }
    it { is_expected.to allow_value(9.99).for(:price) }
    it { is_expected.to_not allow_value('string price').for(:price) }    
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).only_integer }
  end
end

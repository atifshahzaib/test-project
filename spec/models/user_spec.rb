# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one_attached(:image) }
    it { should have_many(:orders).dependent(:destroy) }
    it { should have_many(:products).dependent(:destroy) }
    it { should have_many(:cart_items).dependent(:destroy) }
    it { should have_many(:shipments).through(:orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_length_of(:full_name).is_at_least(6).is_at_most(25) }
  end
end

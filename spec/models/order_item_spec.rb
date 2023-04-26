require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'associations' do
    it { should belong_to(:order) }
  end

  describe 'validations' do
    it { should validate_presence_of(:price) }
    it { is_expected.to allow_value(9.9).for(:price) }
    it { should validate_presence_of(:quantity) }
    it { is_expected.to_not allow_value('abc').for(:price) }
  end
end

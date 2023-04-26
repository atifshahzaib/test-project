require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:order_items).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:amount_paid) }
    it { is_expected.to allow_value(10.0).for(:amount_paid) }
    it { is_expected.to allow_value(10.5).for(:amount_paid) }
    it { is_expected.to_not allow_value("string price").for(:amount_paid) }
    it { is_expected.to_not allow_value("10abc").for(:amount_paid) }
  end
end

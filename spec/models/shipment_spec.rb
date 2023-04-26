# spec/models/shipment_spec.rb
require 'rails_helper'

RSpec.describe Shipment, type: :model do
  describe 'associations' do
    it { should belong_to(:order) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer_name) }
    it { should validate_presence_of(:shipping_address) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:payment_method) }
  end

  describe 'enums' do
    it do
      should define_enum_for(:status)
        .with_values(pending: 'Pending', completed: 'Complete')
        .backed_by_column_of_type(:string)
    end

    it do
      should define_enum_for(:payment_method)
        .with_values(cash_on_delivery: 'Cash On Delivery', card: 'Debit/Credit Card')
        .backed_by_column_of_type(:string)
    end
  end
end

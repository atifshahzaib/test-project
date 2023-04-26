class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :user

  enum status: { pending: 'Pending', completed: 'Complete' }
  enum payment_method: { cash_on_delivery: 'Cash On Delivery', card: 'Debit/Credit Card' }

  validates :customer_name,
            :shipping_address,
            :phone_number,
            :payment_method,
            presence: true
end

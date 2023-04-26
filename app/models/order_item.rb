class OrderItem < ApplicationRecord
  belongs_to :order

  validates :price, presence: true, numericality: { only_decimal: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end

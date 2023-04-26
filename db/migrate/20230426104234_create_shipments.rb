class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.string :customer_name, null: false, default: ''
      t.string :shipping_address
      t.string :phone_number
      t.string :payment_method, null: false, default: 'Cash On Delivery'
      t.string :status, null: false, default: "pending"
      t.references :user, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false

      t.timestamps
    end
  end
end

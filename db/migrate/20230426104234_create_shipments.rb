class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.string :customer_name, null: false, default: ''
      t.string :shipping_address, null: false, default: ''
      t.string :phone_number, null: false, default: ''
      t.string :payment_method, null: false, default: ''
      t.string :status, null: false, default: ""
      t.references :user, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false

      t.timestamps
    end
  end
end

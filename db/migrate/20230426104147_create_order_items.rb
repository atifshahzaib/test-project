class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items, id: :uuid do |t|
      t.decimal :price, null: false, default: 1
      t.integer :quantity, null: false, default: 1
      t.references :product, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end

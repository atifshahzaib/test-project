class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :amount_paid, null: false, default: 0
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

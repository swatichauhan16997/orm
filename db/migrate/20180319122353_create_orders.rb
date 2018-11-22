# migration
class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :order_datetime
      t.integer :quantity
      t.float :price
      t.references :master_order, foreign_key: true

      t.timestamps
    end
  end
end

# migration
class CreateMasterOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :master_orders do |t|
      t.float :total
      t.integer :order_type
      t.integer :order_type
      t.integer :payment_type
      t.integer :order_status
      t.integer :payment_status
      t.string :transaction_id

      t.timestamps
    end
  end
end

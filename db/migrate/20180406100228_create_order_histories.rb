class CreateOrderHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :order_histories do |t|
      t.references :master_order
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end

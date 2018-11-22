# migration
class CreateHomeDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :home_deliveries do |t|
      t.integer :status
      t.references :master_order, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end

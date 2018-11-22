# migration
class CreateRestaurantTables < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurant_tables do |t|
      t.integer :table_capacity
      t.boolean :availability
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

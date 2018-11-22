# migration
class CreateFoodItems < ActiveRecord::Migration[5.1]
  def change
    create_table :food_items do |t|
      t.string :name
      t.float :price
      t.integer :food_type
      t.references :category, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

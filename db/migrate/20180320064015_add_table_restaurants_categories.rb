# migration
class AddTableRestaurantsCategories < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :restaurants do |t|
      t.index [:category_id, :restaurant_id]
      t.index [:restaurant_id, :category_id]
    end
  end
end

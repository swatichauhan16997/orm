# migration for creating restaurant-category model
class CreateRestaurantsCategoriesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants_categories, id: false do |t|
      t.integer :restaurant_id
      t.integer :category_id
    end
  end
end

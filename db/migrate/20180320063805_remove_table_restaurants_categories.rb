# migration
class RemoveTableRestaurantsCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :restaurants_categories
  end
end

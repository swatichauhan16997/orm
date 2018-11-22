class AddFoodCategoryToFoodItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :food_items, :food_category, foreign_key: true
  end
end

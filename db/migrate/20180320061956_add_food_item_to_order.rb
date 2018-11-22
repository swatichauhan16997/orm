# migration
class AddFoodItemToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :food_item, foreign_key: true
  end
end

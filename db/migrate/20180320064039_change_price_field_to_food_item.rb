# migration
class ChangePriceFieldToFoodItem < ActiveRecord::Migration[5.1]
  def change
    change_column :food_items, :price, :decimal
  end
end

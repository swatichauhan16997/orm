# change food item
class AddDescriptionToFoodItems < ActiveRecord::Migration[5.1]
  def change
    add_column :food_items, :description, :string
  end
end

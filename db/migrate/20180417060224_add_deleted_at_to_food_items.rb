class AddDeletedAtToFoodItems < ActiveRecord::Migration[5.1]
  def change
    add_column :food_items, :deleted_at, :datetime
    add_index :food_items, :deleted_at
  end
end

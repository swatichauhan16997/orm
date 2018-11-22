class RenameImageFileName < ActiveRecord::Migration[5.1]
  def change
    add_column :food_items, :image, :string
    add_column :restaurants, :image, :string
    add_column :users, :image, :string
  end
end

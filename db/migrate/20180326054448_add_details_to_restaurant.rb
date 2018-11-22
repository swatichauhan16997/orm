# migration
class AddDetailsToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :details, :text
  end
end

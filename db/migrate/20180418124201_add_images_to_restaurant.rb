class AddImagesToRestaurant < ActiveRecord::Migration[5.1]
  def change
  	add_column :restaurants, :images, :string, array: true, default: [] 
  	# add images column as array
  end
end

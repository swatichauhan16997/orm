# migration
class RenameStreetToAreaInAddresses < ActiveRecord::Migration[5.1]
  def change
    rename_column :addresses, :street, :area
  end
end

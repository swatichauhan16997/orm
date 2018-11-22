# migration
class AddUserToMasterOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :master_orders, :user, foreign_key: true
    add_reference :master_orders, :restaurant, foreign_key: true
  end
end

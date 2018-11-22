# migration
class ChangeTotalFieldToMasterOrder < ActiveRecord::Migration[5.1]
  def change
    change_column :master_orders, :total, :decimal
  end
end

# migration
class ChangePriceFieldToOrder < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :price, :decimal
  end
end

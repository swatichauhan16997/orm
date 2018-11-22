# migration
class ChangePriceFieldToOffer < ActiveRecord::Migration[5.1]
  def change
    change_column :offers, :price, :decimal
  end
end

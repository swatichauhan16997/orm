# migration
class ChangeTotalFieldToMasterOffer < ActiveRecord::Migration[5.1]
  def change
    change_column :master_offers, :total, :decimal
  end
end

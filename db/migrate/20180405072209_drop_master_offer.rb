class DropMasterOffer < ActiveRecord::Migration[5.1]
  def up
    drop_table :master_offers
  end
  def down
    create_table :master_offers do |t|
      t.float :total

      t.timestamps
    end
  end
end

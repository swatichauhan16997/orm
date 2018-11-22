# migration
class CreateMasterOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :master_offers do |t|
      t.float :total

      t.timestamps
    end
  end
end

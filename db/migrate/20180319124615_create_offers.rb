# migration
class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.integer :quantity
      t.float :price
      t.references :restaurant, foreign_key: true
      t.references :food_item, foreign_key: true
      t.references :master_offer, foreign_key: true

      t.timestamps
    end
  end
end

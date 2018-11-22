class AddColumnInOffers < ActiveRecord::Migration[5.1]
  def up
    add_reference :offers, :restaurant, foreign_key: true
    add_reference :offers, :food_item, foreign_key: true
    add_column :offers, :discount, :decimal
    add_index :offers, [:restaurant_id, :food_item_id], :unique => true
  end
  
  def down
    remove_reference :offers, :restaurant, foreign_key: true
    remove_reference :offers, :food_item, foreign_key: true
    remove_column :offers, :discount, :decimal
  end
end

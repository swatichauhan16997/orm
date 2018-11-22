class RemoveColumnInOffer < ActiveRecord::Migration[5.1]
  def up
    remove_column :offers, :quantity, :integer
    remove_column :offers, :price, :decimal
    remove_reference :offers, :master_offer, foreign_key: true
    remove_reference :offers, :restaurant, foreign_key: true
    remove_reference :offers, :food_item, foreign_key: true
  end
  
  def down
    add_column :offers, :quantity, :integer
    add_column :offers, :price, :decimal
    add_reference :offers, :master_offer, foreign_key: true
    add_reference :offers, :restaurant, foreign_key: true
    add_reference :offers, :food_item, foreign_key: true
  end
end

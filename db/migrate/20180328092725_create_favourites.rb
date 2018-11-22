class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.references :user, foreign_key: true
      t.references :favouriteable, polymorphic: true, index: true
      t.timestamps
    end
  end
end

# migration for creating restaurant model
class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone_no
      t.string :email
      t.datetime :opening_time
      t.datetime :closing_time
      t.integer :delivery_types
      t.string :branch_name

      t.timestamps
    end
  end
end

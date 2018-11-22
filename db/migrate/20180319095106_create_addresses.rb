# migration for creating address model
class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.text :addressline
      t.string :street
      t.string :city
      t.string :state
      t.string :pincode
      t.integer :type

      t.timestamps
    end
  end
end

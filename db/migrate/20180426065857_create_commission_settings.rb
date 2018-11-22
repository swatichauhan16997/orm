class CreateCommissionSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :commission_settings do |t|
      t.decimal :commission_percentage

      t.timestamps
    end
  end
end

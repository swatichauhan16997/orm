# migration for add column
class AddIsActiveToDeliveryBoys < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_boys, :is_active, :boolean , default: true
  end
end

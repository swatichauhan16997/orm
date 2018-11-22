class CreateHomedeliverysDeliveryboysJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :home_deliveries, :delivery_boys do |t|
    end
  end
end

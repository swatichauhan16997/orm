# migration
class RemoveMasterOrderFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_reference :orders, :master_order, foreign_key: true
  end
end

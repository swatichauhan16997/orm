class AddColumnInOffer < ActiveRecord::Migration[5.1]
  def up
    add_column :offers, :start_date, :date
    add_column :offers, :end_date, :date
  end

  def down
    remove_column :offers, :start_date, :date
    remove_column :offers, :end_date, :date
  end
end

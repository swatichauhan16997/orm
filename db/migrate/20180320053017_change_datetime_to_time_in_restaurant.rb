# migration
class ChangeDatetimeToTimeInRestaurant < ActiveRecord::Migration[5.1]
  def up
    change_column :restaurants, :opening_time, :time
    change_column :restaurants, :closing_time, :time
  end

  def down
    change_column :restaurants, :opening_time, :datetime
    change_column :restaurants, :closing_time, :datetime
  end
end

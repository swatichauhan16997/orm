class AddAttachmentImageToFoodItems < ActiveRecord::Migration[5.1]
  def self.up
    change_table :food_items do |t|
      # t.attachment :image
    end
  end

  def self.down
    # remove_attachment :food_items, :image
  end
end

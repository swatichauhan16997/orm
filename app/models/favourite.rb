class Favourite < ApplicationRecord
  belongs_to :favouriteable, polymorphic: true

  def fav_restaurant
    Restaurant.find(favouriteable_id)
  end

  def fav_food
    FoodItem.find(favouriteable_id)
  end

end

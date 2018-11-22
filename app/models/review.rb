class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  def user_reviews
    Review.where(user_id: self.user_id).count()
  end

  def user_rating
   rating =  Rate.where(rater_id: self.user_id, rateable_id: self.restaurant_id).pluck(:stars)
   if rating != []
    sum = rating.inject :+
    avg = sum/rating.length
   end
  end
end

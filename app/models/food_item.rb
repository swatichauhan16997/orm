# this model will create instance of All FoodItems of all restaurants
class FoodItem < ApplicationRecord
  acts_as_paranoid
  belongs_to :category
  belongs_to :restaurant
  has_one :offer, dependent: :destroy
  has_one :order
  has_many :favourites, as: :favouriteable
  belongs_to :food_category
  has_many :images, as: :imageable, dependent: :destroy
  mount_uploader :image, ImageUploader
  enum food_type: [:veg, :non_veg]
  validates :restaurant_id,
            :category_id,
            :food_type,
            :price, presence: true

  def offer_price
   (self.price - ((self.price * self.offer.discount)/100)).to_i
  end

  def final_price
    if (self.offer.present?) && ((Date.today >= self.offer.start_date) && (Date.today <= self.offer.end_date))
        offer_price        
    else
        self.price
    end
  end
end

# Model for Restaurant
class Restaurant < ApplicationRecord
  mount_uploaders :images, ImageUploader
  enum type: [:take_away, :home_delivery]
  ratyrate_rateable 'service', 'food'
  has_many :food_items, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_and_belongs_to_many :categories
  has_many :favourites, as: :favouriteable
  has_many :reviews, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_and_belongs_to_many :categories
  belongs_to :user

  VALID_MOBILE_REGEX = /\A^[789]\d{9}$\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true
  validates :phone_no, presence: true, format: { with: VALID_MOBILE_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :branch_name, presence: true

  accepts_nested_attributes_for :address

  scope :active_restaurants, -> { Restaurant.where(status: true) }

  def food_categories
    categories = []
    self.food_items.each do |food_item|
      categories << food_item.food_category
    end
    categories.uniq
  end

  def restaurant_open?
    self.opening_time.strftime('%I:%M %p') <= Time.now && self.closing_time.strftime('%I:%M %p') >= Time.now
  end
  
  # mount_uploader :image, ImageUploader

  def avg_rate
    stars = Rate.all.where(rateable_id: self.id).pluck(:stars)
    if stars != []
      sum = stars.inject :+
      avg = sum / stars.length
    end
  end

  def full_name
    "#{self.name}, #{self.branch_name}, #{self.try(:address).try(:city)}"
  end
end

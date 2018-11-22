# this model will create instance of All categories
class Category < ApplicationRecord
  has_many :food_items
  has_many :food_categories
  has_and_belongs_to_many :restaurants
  has_many :food_items
  validates :name,
            presence: true,
            uniqueness: { scope: :name, message: 'category already added' }
end

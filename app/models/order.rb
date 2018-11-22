# this model will keep records of single orders
class Order < ApplicationRecord
  belongs_to :food_item
end

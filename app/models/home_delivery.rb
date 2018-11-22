# this model will manage home delivery and keeps records
class HomeDelivery < ApplicationRecord
  belongs_to :master_order
  belongs_to :address
  has_and_belongs_to_many :delivery_boys
  enum status: ['pending','assigned', 'on the way','delivered']
end

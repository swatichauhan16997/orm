# this model will keep records of all confirm orders
class MasterOrder < ApplicationRecord
  has_many :orders
  has_one :home_delivery
  enum order_type: ['home delivery', 'pickup']
  enum payment_type: ['cod', 'card']
  enum order_status: ['placed', 'inprogress', 'ready', 'on the way', 'delivered','completed']
  enum payment_status: ['pending', 'paid']
end

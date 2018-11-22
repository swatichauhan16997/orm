# Deliveryboy model is the instance of Deliveryboy
class DeliveryBoy < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum status: [:busy, :available, :on_leave]
  has_and_belongs_to_many :home_deliveries

  before_create :assign_default_status

  def assign_default_status
    self.status = 'available'
  end
end

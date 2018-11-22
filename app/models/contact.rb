class Contact < ApplicationRecord
  belongs_to :user
  validates :email, :description , presence: true
end

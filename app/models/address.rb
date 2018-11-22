# this model will create instance of All Addresses
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true
  def display_address
    "
     Home Address: #{self.addressline}
     Area: #{self.area}
     Pincode: #{self.pincode}
     City: #{self.city}
     State: #{self.state}"
  end

end

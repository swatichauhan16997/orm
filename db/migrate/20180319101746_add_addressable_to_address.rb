# migration for adding polymorphic association to address model
class AddAddressableToAddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :addressable, polymorphic: true
  end
end

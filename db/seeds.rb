# This file should contain all the record creation needed to seed
#   the database with its default values.
# The data can then be loaded with the rails db:seed command (
#   or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

#========================= USER =========================

user1_attributes = {
  username: 'super admin',
  email: 'online.restaurant.management12@gmail.command',
  password: '123456',
  password_confirmation: '123456'
}

def find_or_create_user(user_attrs)
  email = user_attrs[:email]
  user = User.find_by_email(email)

  if user.nil?
    user = User.create(user_attrs)
    puts "Created user having email #{email}"
  else
    puts "User having email #{email} already exists, thus not created"
  end
  user
end

user1 = find_or_create_user(user1_attributes)

user1.roles.delete_all
user1.add_role(:super_admin)


#========================= ADDRESS OF USER =========================

user1.addresses.create(
  addressline: 'Address: Shop No 5,6 Jawahar Shopping Center',
  area: 'Manainagar',
  city: 'Ahmedabad',
  state: 'Gujarat',
  pincode: '380009'
  )

#========================= RESTAURANT =========================


#========================= CATEGORY =========================

category1 = Category.create(name: 'Fast Food')
category2 = Category.create(name: 'Punjabi')
category3 = Category.create(name: 'Gujarati')

#========================= FOOD CATEGORY =========================

food_category1 = category1.food_categories.create(name: 'Pastas')
food_category12 = category1.food_categories.create(name: 'Salads')
food_category13 = category1.food_categories.create(name: 'Beverages')

food_category2 = category2.food_categories.create(name: "Starter")
food_category3 = category2.food_categories.create(name: "Main Course")
food_category4 = category2.food_categories.create(name: "Dessert")
food_category5 = category2.food_categories.create(name: 'Soups')
food_category6 = category2.food_categories.create(name: 'Pastas')

food_category7 = category3.food_categories.create(name: "Starter")
food_category8 = category3.food_categories.create(name: "Main Course")
food_category9 = category3.food_categories.create(name: "Dessert")
food_category10 = category3.food_categories.create(name: 'Soups')
food_category11 = category3.food_categories.create(name: 'Pastas')

#========================= FOOD ITEM =========================


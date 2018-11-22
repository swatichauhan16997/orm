json.restaurants do
  json.array!(@food_restaurants) do |restaurant|
    json.name restaurant.full_name
    json.url restaurant_path(restaurant)
  end
end
json.fooditems do
  json.array!(@fooditems) do |food|
    json.name food.name
    json.url search_path(term: food.name)
  end
end

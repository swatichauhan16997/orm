# Service to add Restaurant to Favourite
class AddRestaurantToFavourite
  attr_accessor :params

  def initialize(params)
    @user = params[:user]
    @restaurant = params[:restaurant]
  end

  def create
    favourite = @restaurant.favourites.find_by(user_id: @user.id)
    if favourite
      favourite.delete
    else
      @restaurant.favourites.find_or_create_by(user_id: @user.id)
    end
  end
end

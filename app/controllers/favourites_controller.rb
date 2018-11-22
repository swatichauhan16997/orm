# Controller for Favourites
class FavouritesController < ApplicationController

  before_action :fetch_favourites, only: [:index, :destroy]

  def index
    authorize Favourite, :index?
    fetch_favourites
  end

  def destroy
    authorize Favourite, :destroy?
    @favourite = Favourite.find(params[:id])
    @favourite.delete
    fetch_favourites
    respond_to do |format|
      format.html do
        redirect_to favourites_path, notice: 'Favourite was successfully destroyed.'
      end
      format.js
    end
  end

  private

  def fetch_favourites
    @favourite_restaurants = Favourite.where(
      user_id: current_user.id,
      favouriteable_type: 'Restaurant'
    )

    @favourite_foods = Favourite.where(
      user_id: current_user.id,
      favouriteable_type: 'FoodItem'
    )
  end
end

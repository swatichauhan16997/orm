# Controller for Categories of Restaurant
class RestaurantscategoriesController < ApplicationController
  # before_action :authenticate_user!

  def new
    authorize Offer, :new?
  end

  def create
    authorize Offer, :new?
    @category = params[:restaurant][:category_ids].reject(&:empty?)
    @category_array = Category.find(@category)
    @restaurant = Restaurant.find(params[:restaurant][:id])
    @restaurant.categories.delete_all
    @category_array.each do |category|
      category.restaurants << @restaurant
    end
    @restaurants = Restaurant.where(user_id: current_user.id)
    redirect_to static_pages_my_account_path
  end

  def show
    skip_authorization
    @restaurant = Restaurant.find(params[:id])
    @category = @restaurant.categories
  end

  def edit
    authorize Offer, :new?
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    skip_authorization
    @restaurants = Restaurant.where(user_id: current_user.id)
  end

  def update
    authorize Offer, :new?
    @restaurant = Restaurant.find(params[:id])
    @restaurant.categories.delete_all
    @category_ids = params[:restaurant][:category_ids].reject(&:empty?)
    @category_array = Category.find(@category_ids)
    @category_array.each do |category|
      category.restaurants << @restaurant
    end

    @restaurants = Restaurant.where(user_id: current_user.id)

    respond_to do |format|
      format.html { render(partial: 'restaurant_category_list') }
      format.js { render 'index' }
    end
  end
end

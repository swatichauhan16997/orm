# Controller for Food Items
class FoodItemsController < ApplicationController
  before_action :food_item_params, only: [:update]
  before_action :set_food_item, only: [:show, :edit, :update, :destroy, :add_food_to_fav]

  def index
    skip_authorization
    if current_user.has_role? :admin
      @fooditems = FoodItem.where(restaurant_id: current_user.restaurant_ids)
    else
      @fooditems = FoodItem.all.includes(:restaurant, :category)
    end
  end

  def new
    authorize FoodItem, :new?
    @fooditem = FoodItem.new
    @fooditem.images.build
  end

  def create
    authorize FoodItem, :create?
    @fooditem = FoodItem.new(food_item_params)

    if @fooditem.save
      @fooditems = FoodItem.all
      respond_to do |format|
        format.html { render(partial: 'restaurants/show') }
        format.js { render 'index' }
      end
    else
      render 'new'
    end
  end

  def edit
    authorize(@fooditem, :edit?)
  end

  def show
    skip_authorization
  end

  def update
    authorize(@fooditem, :update?)
    if @fooditem.update(food_item_params)
      @fooditems = FoodItem.all
      render 'index'
    else
      render 'edit'
    end
  end

  def destroy
    authorize(@fooditem, :destroy?)
    @fooditem.destroy
    @fooditems = FoodItem.all
    render('index')
    # redirect_to food_items_path
  end

  def category_list
    @category = Category.find(params[:id])
  end

  def main_category_list
    @restaurant = Restaurant.find(params[:id])
  end

  def add_food_to_fav
    authorize FoodItem, :add_food_to_fav?
    AddFoodToFavourite.new({user: current_user, fooditem: @fooditem}).create
    respond_to do |format|
      format.html do
        redirect_to restaurant_path(@fooditem.restaurant),
                    notice: 'Added to Favourite.'
      end
      format.js
    end
  end

  private

  def set_food_item
    @fooditem = FoodItem.find(params[:id])
  end

  def food_item_params
    params.require(:food_item).permit(:name, :price, :food_type, :food_category_id,
                                      :restaurant_id, :category_id, :image)
  end


end

 # FoodCategory Controller
class FoodCategoriesController < ApplicationController
  def new
    authorize FoodCategory, :new?
    @food_category = FoodCategory.new
  end

  def create
    authorize FoodItem, :create?
    @food_category = FoodCategory.new(food_category_params)
    if @food_category.save
      # redirect_to food_category_path(@food_category)
      respond_to do |format|
        format.html { render(partial: 'foodcategorylist') }
        format.js
      end
    end
  end

  def edit
    authorize FoodCategory, :edit?
    @food_category = FoodCategory.find(params[:id])

  end

  def update
    authorize FoodItem, :update?
    @food_category = FoodCategory.find(params[:id])
      if @food_category.update(food_category_params)
        redirect_to food_category_path(@food_category)
      else
        render 'edit'
      end
  end

  def index
    skip_authorization
    @food_categories = FoodCategory.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    authorize FoodCategory, :destroy?
    @food_category = FoodCategory.find(params[:id])
    @food_category.destroy
    redirect_to food_categories_path
  end

  def show
    skip_authorization
    @food_category = FoodCategory.find(params[:id])
  end

  def change_category
    authorize FoodCategory, :change_category?
    @category = Restaurant.find(params[:category]).id
  end

  private

  def food_category_params
    params.require(:food_category).permit(:restaurant_id, :category_id, :name)
  end
end

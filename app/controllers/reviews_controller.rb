# Controller for Reviews
class ReviewsController < ApplicationController

  def create
    authorize Review, :create?
    # @restaurant = Restaurant.find(params[:review][:restaurant_id])
    authorize Review, :create?
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.name = current_user.username
    @review.save
    respond_to do |format|
      format.html do
        redirect_to restaurant_path(@restaurant.id),
        notice: 'Review Added.'
      end
      format.js
    end
  end

  def edit
    authorize Review, :edit?
    @review = Review.find(params[:id])
  end

  def update
    authorize Review, :update?
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
    end
  end

  def review_edit
    authorize Review, :review_edit?
    @review = Review.find(params[:id])
  end

  def review_update
    authorize Review, :review_update?
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      @reviews = Review.all
    end
  end

  def destroy
    authorize Review, :destroy?
    @review = Review.find(params[:id])
    @review.destroy
  end

  def index
    authorize Review, :index?
    if current_user.has_role? :super_admin
      @reviews = Review.all
    elsif current_user.has_role? :admin
      @reviews = Review.where(restaurant_id: current_user.restaurant_ids)
    elsif current_user.has_role? :customer
      @reviews = Review.where(user_id: current_user.id)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def review_delete
    authorize Review, :review_delete?
    @review = Review.find(params[:id])
    @review.destroy
    @reviews = Review.all
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :comment, :name, :restaurant_id)
  end
end

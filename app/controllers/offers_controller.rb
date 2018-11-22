# Controller for Offers
class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :update]

  def new
    authorize Offer, :new?
    @offer = Offer.new
    @restaurant = Restaurant.where(user_id: current_user.id).first
  end

  def create
    authorize Offer, :create?
    @offer = Offer.new(offer_params)
    if @offer.save
      find_offer
      @fooditem = FoodItem.find(params[:offer][:food_item_id])
      respond_to do |format|
        format.html { render('index') }
        format.js { render 'index' }
      end
    else
      render 'new'
    end
  rescue ActiveRecord::RecordNotUnique
    flash[:notice] = 'All ready create a offer'
    render :new
  end

  def change_foodlist
    authorize Offer, :change_foodlist?
    @food = Restaurant.find(params[:food]).food_items
  end

  def view_all_offers
    authorize Offer, :view_all_offers?
    @offers = Offer.all
  end

  def index
    authorize Offer, :index?
    find_offer
  end

  def destroy
    authorize Offer, :destroy?
    @offer.destroy
    find_offer
    respond_to do |format|
      format.html { render(partial: 'index') }
      format.js { render 'index' }
    end
  end

  def show 
    skip_authorization
  end

  def update
    authorize Offer, :update?
    if @offer.update(offer_params)
      find_offer
      respond_to do |format|
        format.html { render(partial: 'index') }
        format.js { render 'index' }
      end
    else
      render 'new'
    end
  end

  def edit
    authorize Offer, :edit?
    @offer.restaurant_id = nil
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def find_offer
    @offers = []
    current_user.restaurants.each do |restaurant|
      if restaurant.offers.count != 0
        @offers.push(restaurant.offers)
      end
    end
  end

  def offer_params
    params.require(:offer).permit(:restaurant_id,
                                  :food_item_id,
                                  :discount,
                                  :start_date,
                                  :end_date)
  end

end

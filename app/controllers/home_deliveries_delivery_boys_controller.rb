# controller of homedelivery_deliveryboys
class HomeDeliveriesDeliveryBoysController < ApplicationController
  def index
    authorize User, :edit?
    @home_deliveries = HomeDelivery.all.includes(:master_order,:homedeliveries_delivery_boys, :delivery_boys)
  end

  def new
    authorize User, :new?
    @home_delivery = HomeDelivery.find(params[:home_delivery])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    authorize User, :new?
    @home_delivery = HomeDelivery.find(params[:home_delivery_id])
    @delivery = params[:delivery_boy_ids]
    if @delivery.nil?
      render 'new'
    else
      @delivery_boy = DeliveryBoy.find(@delivery[:id])
      @home_delivery.delivery_boys << @delivery_boy
      @home_delivery.update_attribute(:status, 'assigned')
      @home_delivery.master_order.update_attribute(:order_status, 'ready')
      @delivery_boy.update_attribute(:status, 'busy')
      redirect_to home_deliveries_delivery_boys_path
    end
  end
  
  def get_home_delivery
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize HomeDelivery, :edit?
    end
    @home_deliveries = current_delivery_boy.home_deliveries
  end


  def edit
    authorize User, :new?
  end

  def show 
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize User, :edit?
    end
  end
end

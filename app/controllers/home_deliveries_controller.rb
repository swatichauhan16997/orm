# Home_delivery controller
class HomeDeliveriesController < ApplicationController
  def new
    authorize HomeDelivery, :new?
    @home_delivery = HomeDelivery.new
    @master_order = MasterOrder.find(params[:master_order])
    @address = Address.new
    @addresses = Address.where(addressable_id: current_user.id)
  end

  def create
    authorize HomeDelivery, :create?
    @master_order = MasterOrder.find(params[:master_order_id])
    @home_delivery = @master_order.create_home_delivery(home_delivery_params)
    @home_delivery.update_attribute(:status, 'pending')
    redirect_to static_pages_my_account_path
  end

  def create_address
    authorize Address, :create?
    # @address = Address.new(address_params)
    @address = current_user.addresses.create(address_params)
    respond_to do |format|
      format.html { redirect_to addresses_path, notice: 'Address successfully addeed.' }
      format.js
    end
  end

  def add_address
    @address = Address.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    authorize HomeDelivery, :index?
    @home_deliveries = HomeDelivery.all.includes(:master_order, :address)
    @useraddress = Address.where(addressable_id: current_user.id)
    @homedeliveries = HomeDelivery.where(address_id: @useraddress.id)
  end

  def change_home_delivery_status
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize HomeDelivery, :change_home_delivery_status?
    end
  end

  def edit
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize HomeDelivery, :edit?
    end
    @home_delivery = HomeDelivery.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize HomeDelivery, :update?
    end
    @home_delivery = HomeDelivery.find(params[:id])
    @home_deliveries = current_delivery_boy.home_deliveries
    if @home_delivery.update_attributes(home_delivery_params)
      master_order = @home_delivery.master_order
      master_order.update_attribute(:order_status, @home_delivery.status)
      if @home_delivery.status == 'delivered'
        current_delivery_boy.update_attribute(:status, 'available')
      end
      flash[:success] = 'Status updated!'
      respond_to do |format|
        format.html do
          render(partial: 'home_deliveries_delivery_boys/home_deliveries')
        end
        format.js
      end
    else
      render 'edit'
    end
  end

  def show
    authorize HomeDelivery, :show?
  end

  private

  def home_delivery_params
    params.require(:home_delivery).permit(:status, :address_id, :master_order_id)
  end

  def address_params
    params.require(:address).permit(:addressline, :area, :city,
                                    :state, :pincode)
  end
end

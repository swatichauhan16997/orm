# address controller
class AddressesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    # @addresses = Address.all
    authorize Address, :index?
    @addresses = Address.where(addressable_id: current_user.id)
  end

  def new
    @address = Address.new
  end

  def create
    authorize Address, :create?
    # @address = Address.new(address_params)
    @address = current_user.addresses.create(address_params)
    if @address.save
      redirect_to @address
    else
      render 'new'
    end
  end

  def edit
    authorize(@address, :edit?)
    @address = Address.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    authorize(@address, :update?)
    @address = Address.find(params[:id])
    @address.update(address_params)
    @addresses = current_user.addresses
  end

  def change_city
    authorize Address, :change_city?
    params[:state]
    @state = CS.states(:in).key(params[:state])
  end

  def destroy
    authorize(@address, :destroy?)
    @address.destroy
    redirect_to addresses_path
  end

  def show
    authorize(@address, :show?)
  end

  def view_address
    authorize Address, :view_address?
    @addresses = Address.where(addressable_id: current_user.id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:addressline, :area, :city,
                                    :state, :pincode)
  end
end

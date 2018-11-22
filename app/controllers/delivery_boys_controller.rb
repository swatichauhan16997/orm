# Controller for Delivery Boys
class DeliveryBoysController < ApplicationController
  def new
    authorize DeliveryBoy, :new?
    @delivery_boy = DeliveryBoy.new
  end

  def create
    authorize DeliveryBoy, :create?
    @delivery_boy = DeliveryBoy.new(delivery_boy_params) do |delivery_boy|
      password = SecureRandom.hex(8)
      delivery_boy.password = password
    end
    if @delivery_boy.save
      @delivery_boys = DeliveryBoy.all
      DeliveryboyMailer.deliveryboy_registration_mail(@delivery_boy).deliver_now
      respond_to do |format|
        format.html do
          render(partial: 'deliveryboys')
        end
        format.js{ render(partial: 'deliveryboys') }
      end
    else
      render 'new'
      # redirect_to static_pages_my_account_path
    end
  end

  def index
    authorize DeliveryBoy, :index?
    @delivery_boys = DeliveryBoy.all
  end

  def show
    skip_authorization
    @delivery_boy = DeliveryBoy.find(params[:id])
    respond_to do |format|
      format.html do
        render(partial: 'showdeliveryboy')
      end
      format.js
    end
  end

  def edit
    authorize DeliveryBoy, :edit?
    @delivery_boy = DeliveryBoy.find(params[:id])
  end

  def update
    authorize DeliveryBoy, :update?
    @delivery_boy = DeliveryBoy.find(params[:id])
    if @delivery_boy.update(delivery_boy_params)
      @delivery_boys = DeliveryBoy.all
      respond_to do |format|
        format.html do
          render(partial: 'deliveryboys')
        end
        format.js
      end
    else
      render 'edit'
    end
  end

  def editprofile
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize DeliveryBoy, :editprofile?
    end

    @delivery_boy = DeliveryBoy.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def updateprofile
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize DeliveryBoy, :editprofile?
    end

    @delivery_boy = DeliveryBoy.find(params[:id])
    if @delivery_boy.update(delivery_boy_params)
      @delivery_boys = DeliveryBoy.all
      respond_to do |format|
        format.html do
          render(partial: 'userprofile')
        end
        format.js
      end
    else
      render 'editprofile'
    end
  end

  def change_delivery_boy_status
    authorize DeliveryBoy, :change_delivery_boy_status?
    @delivery_boy = DeliveryBoy.find(params[:id])
    @delivery_boy.is_active = !@delivery_boy.is_active
    @delivery_boy.save
  end

  def destroy
    authorize DeliveryBoy, :destroy?
    @delivery_boys = DeliveryBoy.all
    @delivery_boy = DeliveryBoy.find(params[:id])
    if @delivery_boy.destroy
      respond_to do |format|
        format.html do
          render(partial: 'deliveryboys')
        end
        format.js
      end
    end
  end

  def change_password_edit
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize DeliveryBoy, :change_password_edit?
    end

    @delivery_boy = current_delivery_boy
    respond_to do |format|
      format.html
      format.js
    end
  end

  def change_password_update
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize DeliveryBoy, :editprofile?
    end

    @delivery_boy = current_delivery_boy
    if @delivery_boy.update_with_password(change_password_params)
      flash[:success] = 'Password updated'
      bypass_sign_in(@delivery_boy)
      respond_to do |format|
        format.html do
          render(partial: 'userprofile')
        end
        format.js
      end
    else
      render 'change_password_edit'
    end
  end

  def profile
    if current_delivery_boy.present?
      skip_authorization
    else
      authorize DeliveryBoy, :editprofile?
    end

    @delivery_boy = current_delivery_boy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def delivery_boy_params
    params.require(:delivery_boy).permit(:firstname, :lastname,
                                         :username, :phoneno, :email)
  end

  def change_password_params
    params.require(:delivery_boy).permit(:current_password, :password,
                                         :password_confirmation)
  end
end

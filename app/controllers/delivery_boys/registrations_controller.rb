# frozen_string_literal: true

module DeliveryBoys
  # Controller for Registration of Delivery Boys
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
      authorize User, :new?
      @delivery_boy = DeliveryBoy.new
    end

    # POST /resource
    def create
      # super
      authorize User, :new?
      @delivery_boy = DeliveryBoy.new(delivery_boy_params) do |delivery_boy|
        password = SecureRandom.hex(8)
        delivery_boy.password = password
      end

      if @delivery_boy.save
        DeliveryboyMailer.deliveryboy_registration_mail(@delivery_boy)
                                        .deliver_now.redirect_to root_path
        # else
        # render 'new'
      end
    end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    private

    def delivery_boy_params
      params.require(:delivery_boy).permit(:firstname, :lastname,
                                           :username, :email, :phoneno)
    end
  end
end

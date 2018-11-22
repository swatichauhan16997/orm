# frozen_string_literal: true
require "stripe"
Stripe.api_key = "sk_test_yK8JeCfpwfzeaMyUU5krUOXo"
module Users
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    def create
  build_resource(sign_up_params)

  resource.save
  yield resource if block_given?
  if resource.persisted?
    if resource.active_for_authentication?
      set_flash_message! :notice, :signed_up
      sign_up(resource_name, resource)
      # if (params[:role] == "Customer")
        resource.add_role :customer
        respond_with resource, location: after_sign_up_path_for(resource)
      # else
        # resource.add_role :admin
        # redirect_to new_bank_account_path
      # end
    else
      set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
      expire_data_after_sign_in!
      respond_with resource, location: after_inactive_sign_up_path_for(resource)
    end
  else
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
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
      def sign_up_params
        params.require(:user).permit(:firstname, :lastname, :username, :phoneno, :email, :password, :password_confirmation, :customer_id, :account_id)
      end

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
    end
  end

# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    def create
      self.resource = warden.authenticate!(auth_options)
      user = User.find(self.resource.id)
      if (user.is_active && user.has_role?(:customer))
        set_flash_message!(:success, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      elsif (user.is_active && user.has_role?(:admin))
        set_flash_message!(:success, :signed_in)
        if(current_user.customer_id == nil && current_user.account_id == nil)
          redirect_to new_bank_account_path 
        else
          redirect_to static_pages_my_account_path
        end
      elsif (user.is_active && user.has_role?(:super_admin))
        set_flash_message!(:success, :signed_in)
        redirect_to static_pages_my_account_path
      else
        flash[:danger] = "Your account is deactivated"
        sign_out user
        redirect_to root_path
      end
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end

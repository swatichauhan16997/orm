module DeliveryBoys
  # ParameterSanitizer for DeliveryBoys Devise
  class ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      @params.permit(:sign_up, keys: [:username, :phoneno,
                                      :firstname, :lastname, :status])
    end
  end
end

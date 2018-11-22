# class policy for delivery_boy module
class DeliveryBoyPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.has_role? :super_admin
  end

  def create?
    user.has_role? :super_admin
  end

  def index?
    user.has_role? :super_admin
  end

  def edit?
    user.has_role? :super_admin
  end

  def update?
    user.has_role? :super_admin
  end

  def editprofile
    false
  end

  def updateprofile
   false
  end

  def change_delivery_boy_status?
    user.has_role? :super_admin
  end

  def destroy?
    user.has_role? :super_admin
  end

  def change_password_edit?
    false
  end

  def change_password_update?
    false
  end

  def profile
    false
  end

end

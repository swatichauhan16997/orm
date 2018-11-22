 # class policy for home-delivery module
class HomeDeliveryPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def create?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def index?
    true
  end

  def change_home_delivery_status?
    false
  end

  def edit?
    false
  end

  def update?
    false
  end

  def show?
    true
  end
end

# class policy for master order module
class MasterOrderPolicy < ApplicationPolicy
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
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def destroy?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def show?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def bill_details?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def my_orders?
    (user.has_role? :super_admin) || (user.has_role? :admin)
  end

end

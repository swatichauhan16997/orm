# class policy of address module
class AddressPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    (user.has_role? :super_admin) || (user.has_role? :admin)
  end

  def new?
    (user.has_role? :admin) || (user.has_role? :customer) || (user.has_role? :super_admin)
  end

  def create?
    (user.has_role? :admin) || (user.has_role? :customer) || (user.has_role? :super_admin)
  end

  def edit?
    (user.has_role? :admin) || ((user.has_role? :customer) && (record.addressable_id == user.id))
  end

  def update?
    (user.has_role? :admin) || ((user.has_role? :customer) && (record.addressable_id == user.id))
  end

  def show?
    (user.has_role? :admin) || ((user.has_role? :customer) && (record.addressable_id == user.id))
  end

  def change_city?
    (user.has_role? :admin) || (user.has_role? :customer)
  end

  def destroy?
    (user.has_role? :admin) || ((user.has_role? :customer) && (record.addressable_id == user.id))
  end

  def view_address?
    (user.has_role? :admin) || (user.has_role? :customer)
  end

end

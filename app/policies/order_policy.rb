# class policy for order module
class OrderPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def edit?
    (user.has_role? :customer)
  end

  def show?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

end
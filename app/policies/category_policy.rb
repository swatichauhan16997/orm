# class policy for category module
class CategoryPolicy < ApplicationPolicy
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

  def edit?
    user.has_role? :super_admin
  end

  def update?
    true
  end

  def destroy?
    user.has_role? :super_admin
  end
end

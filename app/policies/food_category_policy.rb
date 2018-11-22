# class policy for food_category module
class FoodCategoryPolicy < ApplicationPolicy
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
    true
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

  def change_category?
    user.has_role? :super_admin
  end
end

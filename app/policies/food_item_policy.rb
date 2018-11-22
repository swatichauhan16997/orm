# class policy for food-item module
class FoodItemPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    (user.has_role? :super_admin) || (user.has_role? :admin)
  end

  def create?
    (user.has_role? :super_admin) || (user.has_role? :admin)
  end

  def edit?
    (user.has_role? :super_admin) || ((user.has_role? :admin) && record.restaurant.user == user)
  end

  def update?
    (user.has_role? :super_admin) || ((user.has_role? :admin) && record.restaurant.user == user)
  end

  def destroy?
    (user.has_role? :super_admin) || ((user.has_role? :admin) && record.restaurant.user == user)
  end

  def add_food_to_fav?
    true
  end

end

# class policy for restaurant module
class RestaurantPolicy < ApplicationPolicy
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
    (user.has_role? :super_admin) || ((user.has_role? :admin) && (record.user == user))
  end

  def update?
    (user.has_role? :super_admin) || ((user.has_role? :admin) && (record.user == user))
  end

  def destroy?
    (user.has_role? :super_admin) || ((user.has_role? :admin) && (record.user == user))
  end

  def new_release?
    (user.has_role? :super_admin) || (user.has_role? :admin)
  end

  def add_restaurant_to_fav?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role?(:customer))
  end

  def restaurant_list?
    (user.has_role? :super_admin) || (user.has_role? :admin)
  end

  def change_restaurant_status?
    (user.has_role? :super_admin)
  end

end

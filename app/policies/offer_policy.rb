# class policy for offer module
class OfferPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def new?
    user.has_role? :admin
  end

  def create?
    true
  end

  def change_foodlist?

  end

  def view_all_offers?
    user.has_role? :super_admin # and also for cusmer and normal user
  end

  def index?
    user.has_role? :admin
  end

  def destroy?
    user.has_role? :admin
  end

  def update?
    true
  end

  def edit?
    user.has_role? :admin
  end

end

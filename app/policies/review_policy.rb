# class policy for review module
class ReviewPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.has_role? :customer
  end

  def edit?
    user.has_role? :customer
  end

  def update?
    user.has_role? :customer
  end

  def review_edit?
    user.has_role? :customer
  end

  def review_update?
    user.has_role? :customer
  end

  def destroy?
    user.has_role? :customer
  end

  def index?
    true
  end

  def review_delete?
    user.has_role? :customer
  end

end

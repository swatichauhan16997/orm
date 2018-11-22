# class policy for contact module
class ContactPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end
  def new?
    user.has_role? :customer
  end

  def create?
    user.has_role? :customer
  end
end

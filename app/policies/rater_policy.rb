# class policy for rater module
class RaterPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?

  end

end

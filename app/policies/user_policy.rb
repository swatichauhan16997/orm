# class policy of User module
class UserPolicy < ApplicationPolicy
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

  def index?
    user.has_role? :super_admin
  end

  def edituser?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def updateprofile?
    true
  end

  def show?
    true
  end

  def destroy?
    user.has_role? :super_admin
  end

  def change_password_edit?
    true
  end

  def change_password_update?
    true
  end

  def role_assign?
    user.has_role? :super_admin
  end

  def assign_role?
    user.has_role? :super_admin
  end

  def change_user_status?
    user.has_role? :super_admin
  end

  def profile?
   true
  end

  def add_address?
    user.has_role? :customer
  end

end

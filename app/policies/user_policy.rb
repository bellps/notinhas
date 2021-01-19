class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_is_owner_of_profile?
  end

  def edit?
    user_is_owner_of_profile?
  end
  
  def update?
    user_is_owner_of_profile?
  end

  def destroy?
    user_is_owner_of_profile?
  end

  private
  def user_is_owner_of_profile?
    @user == @record
  end
end

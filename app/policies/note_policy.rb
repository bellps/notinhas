class NotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    @record.public? || user_is_owner_of_note?
  end

  def edit?
    user_is_owner_of_note?
  end

  def update?
    user_is_owner_of_note?
  end

  def destroy?
    user_is_owner_of_note?
  end

  private
  def user_is_owner_of_note?
    @user == @record.user
  end
end

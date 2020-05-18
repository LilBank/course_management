class UserPolicy < ApplicationPolicy
  def index?
    can_make_changes?
  end
  def resolve
    scope.all
  end
  def create?
    can_make_changes?
  end
  def update?
    can_make_changes?
  end
  def edit?
    can_make_changes?
  end
  def destroy?
    can_make_changes?
  end
  def can_make_changes?
    @user.role == "Instructor"
  end
end

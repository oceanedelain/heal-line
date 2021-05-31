class DoctorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    return create?
  end

  def update?
    true
  end

  def destroy?
    record.user == user
  end
end

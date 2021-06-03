class ConsultationPolicy < ApplicationPolicy
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

  def show?
    return true
  end

  def edit?
    return create?
  end

  def update?
  record.user == user
  end

  def destroy?
    record.user == user
  end
end

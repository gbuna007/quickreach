class TriggerPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    record.first.user = user
  end

  def create?
    true
  end

  def update?
    true
  end
end

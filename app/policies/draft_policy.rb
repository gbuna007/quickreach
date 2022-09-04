class DraftPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def index
    record.empty? ? true : record.first.user == user
  end

  def update?
    record.template.user == user
  end
end

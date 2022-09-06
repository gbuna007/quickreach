class DraftPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def update?
    record.trigger.account.user == user
  end

  def send_draft?
    record.trigger.account.user == user
  end
end

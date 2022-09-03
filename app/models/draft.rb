class Draft < ApplicationRecord
  belongs_to :trigger

  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit :notify_recipient

  private

  def notify_recipient
    raise
    DraftNotification.with(draft: self).deliver_later(current_user)
  end
end

# To deliver this notification:
#
# DraftNotification.with(post: @post).deliver_later(current_user)
# DraftNotification.with(post: @post).deliver(current_user)

class DraftNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "DraftMailer"

  param :draft

  def url
    drafts_path
  end

  def message
    t(".message")
  end
end

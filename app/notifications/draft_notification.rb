# To deliver this notification:
#
# DraftNotification.with(post: @post).deliver_later(current_user)
# DraftNotification.with(post: @post).deliver(current_user)

class DraftNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "DraftMailer", if: :email_notifications?

  def url
    # change this to the draft link
  end

end

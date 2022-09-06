class DraftMailer < ApplicationMailer
  before_action { @recipient = params[:recipient] }
  before_action { @draft = params[:draft]}

  default to:       -> { @recipient.email },
          from:     -> { "grace@ndom-forest.io" }

  def draft_notification
    # @user = User.first
    # This will render a view in `app/views/user_mailer`!
    mail(
          subject: 'You have a new draft!',
          track_opens: 'true',
          message_stream: 'draft-notification'
    )
  end
end

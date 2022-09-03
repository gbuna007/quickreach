class DraftMailer < ApplicationMailer
  before_action { @recipient = params[:recipient] }
  before_action { @draft = params[:draft]}

  default to:       -> { @recipient.email },
          from:     -> { @recipeient.email }

  def new_draft_ready
    # @user = User.first
    # This will render a view in `app/views/user_mailer`!
    mail(subject: 'You have a new draft!')
  end

  def draft_notification
    # @user = User.first
    # This will render a view in `app/views/user_mailer`!
    mail(subject: 'You have a new draft!')
  end
end

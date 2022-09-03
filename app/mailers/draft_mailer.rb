class DraftMailer < ApplicationMailer
  def new_draft_ready
    @user = User.first
    # This will render a view in `app/views/user_mailer`!
    mail(to: @user.email, subject: 'You have a new draft!')
  end
end

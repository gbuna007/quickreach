class TriggerMailer < ApplicationMailer
  def quickreach
    @contact = params[:contact] # Instance variable => available in view
    mail(to: @contact.email, subject: 'Test quick reach')
    # This will render a view in `app/views/user_mailer`!
  end
end

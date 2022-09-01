class TriggerMailer < ApplicationMailer
  def template
    @template = params[:template] # Instance variable => available in view
    @contact = Contact.first
    mail(to: @contact.email, subject: 'Test quick reach')
    # This will render a view in `app/views/user_mailer`!
  end
end

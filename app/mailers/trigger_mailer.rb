class TriggerMailer < ApplicationMailer
  def template
    @template = params[:template] # Instance variable => available in view
    @trigger = params[:trigger]
    @contact = Contact.first
    mail(
      to: @contact.email,
      from: "grace@random-forest.io",
      subject: 'Test quick reach',
      html_body:,
      track_opens: 'true',
      message_stream: 'outbound'
    )
    # This will render a view in `app/views/user_mailer`!
  end

  def send_draft(draft)
    @draft = draft
    mail(
      subject: @draft.edited_subject,
      to: @draft.trigger.contact.email,
      from: 'grace@random-forest.io',
      html_body: @draft.edited_body,
      track_opens: 'true',
      message_stream: 'outbound'
    )
  end
end

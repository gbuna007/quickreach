# Preview all emails at http://localhost:3000/rails/mailers/trigger_mailer
class TriggerMailerPreview < ActionMailer::Preview
  def template
    trigger = Trigger.first
    contact = trigger.contact
    template = trigger.template
    # This is how you pass value to params[:user] inside mailer definition!
    TriggerMailer.with(template:).template
  end
end

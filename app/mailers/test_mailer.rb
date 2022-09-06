class TestMailer < ApplicationMailer
  default from: 'grace@random-forest.io'

  def hello
    mail(
      subject: 'Hello from Postmark',
      to: 'grace@random-forest.io',
      from: 'grace@random-forest.io',
      html_body: '<strong>Hello</strong> dear Postmark user.',
      track_opens: 'true',
      message_stream: 'draft-notification'
    )
  end
end

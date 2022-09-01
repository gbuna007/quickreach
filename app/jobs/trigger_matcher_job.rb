require 'pry-byebug'

class TriggerMatcherJob < ApplicationJob
  queue_as :default

  def perform
    if BREAKING_NEWS.count > 0
      triggers = Trigger.all
      BREAKING_NEWS.each do |bn|
        # check if any bn matches any of the triggers' keywords
        triggers.each do |trigger|
          result = trigger.keywords.all? do |tkw|
            bn.values.flatten.join(" ").include?(tkw["name"])
          end # result will be true or false.
          # if true, notify user
          # if true, create draft
          if result
            draft = Draft.new
            draft.trigger = trigger
            draft.template = trigger.template

            body = draft.template.body
            draft.edited_body = body
            subject = draft.template.subject
            draft.edited_subject = subject

            var = {
              account_name: draft.trigger.account.name,
              contact_fn: draft.trigger.contact.first_name
            }

            var.each do |k, v|
              draft.edited_body.gsub!("<<#{k}>>", v)
              draft.edited_subject.gsub!("<<#{k}>>", v)
            end

            draft.save!
          end
        end
      end
    end
  end
end

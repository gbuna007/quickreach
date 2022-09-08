require 'pry-byebug'

class TriggerMatcherJob < ApplicationJob
  queue_as :default

  def perform
    breaking_news = News.where(breaking: true)
    if breaking_news.count > 0
      triggers = Trigger.all
      breaking_news.each do |bn|
        # check if any bn matches any of the triggers' keywords

        triggers.each do |trigger|
          result = trigger.keywords.all? do |tkw|
            bn.attributes.values.join(" ").include?(tkw["name"])
          end
          # if true, create draft
          if result
            matched_true(trigger, bn)
            # draft = Draft.new
            # draft.trigger = trigger
            # draft.news = bn
            # @recipient = draft.trigger.account.user

            # body = draft.trigger.template.body
            # draft.edited_body = body
            # subject = draft.trigger.template.subject
            # draft.edited_subject = subject

            # var = {
            #   account_name: draft.trigger.account.name,
            #   contact_fn: draft.trigger.contact.first_name,
            #   account_category: draft.trigger.account.category
            # }

            # var.each do |k, v|
            #   draft.edited_body.gsub!("<<#{k}>>", v)
            #   draft.edited_subject.gsub!("<<#{k}>>", v)
            # end

            # draft.save!

            # DraftNotification.with(draft:).deliver_later(@recipient)
          end
        end
      end
    end
  end

  private

  def matched_true(trigger, bn)
    draft = Draft.new
    draft.trigger = trigger
    draft.news = bn
    @recipient = draft.trigger.account.user

    body = draft.trigger.template.body
    draft.edited_body = body
    subject = draft.trigger.template.subject
    draft.edited_subject = subject

    var = {
      account_name: draft.trigger.account.name,
      contact_fn: draft.trigger.contact.first_name,
      account_category: draft.trigger.account.category
    }

    var.each do |k, v|
      draft.edited_body.gsub!("<<#{k}>>", v)
      draft.edited_subject.gsub!("<<#{k}>>", v)
    end

    draft.save!

    DraftNotification.with(draft:).deliver_later(@recipient)
  end
end

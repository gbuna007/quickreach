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
            draft.save!
          end
        end
      end
    end
  end
end

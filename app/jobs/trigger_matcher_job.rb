require 'pry-byebug'

class TriggerMatcherJob < ApplicationJob
  queue_as :default

  def perform
    if BREAKING_NEWS.count > 0
      triggers = Trigger.all
      BREAKING_NEWS.each do |bn|
        # check if any bn matches any of the triggers' keywords

        # bn.values.flatten.join(" ") = "this is a placeholder title straitstimes.com grab gojek drivers earnings acquisition Bunardi   this is a placeholder content grab ride-hailing  drivers angry valuation drop overvalued 2022-08-30  "
        triggers.each do |trigger|
          result = trigger.keywords.all? do |tkw|
            bn.values.flatten.join(" ").include?(tkw["name"])
          end # result will be true or false.

          # if true, notify user
          # if true, create draft
        end
      end
    end
  end
end

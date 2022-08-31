class PingerJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm pretending to pull from the api"
    sleep 10
    puts "OK I'm done now"
  end
end

require 'open-uri'
require 'json'
# require 'pry-byebug'

class PingerJob < ApplicationJob
  queue_as :default

  def perform
    url = "http://localhost:3000/api/v1/news"
    json = URI.open(url).read
    data = JSON.parse(json)

    if data.count > 0
      data.each do |news|
        MatcherJob.perform_later(news.id)
      end
    end
  end
end

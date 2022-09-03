require 'open-uri'
require 'json'
require 'pry-byebug'

class PingerJob < ApplicationJob
  queue_as :default

  def perform
    url = "http://localhost:3000/api/v1/news"
    json = URI.open(url).read
    data = JSON.parse(json)

    #if any of the link value in @old_news match any news["link"] in data, reject from new_news
    # data.each do |news|
    #   old_news.each do |on|
    #     if on.link != news["link"]
    #       BREAKING_NEWS << news
    #     end
    #   end
    # end
  end
end

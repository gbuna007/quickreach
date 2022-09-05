require 'open-uri'
require 'json'
require 'pry-byebug'

class PingerJob < ApplicationJob
  queue_as :default

  def perform
    url = "http://localhost:3000/api/v1/news"
    json = URI.open(url).read
    data = JSON.parse(json)
  end
end

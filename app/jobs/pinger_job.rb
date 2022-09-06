require 'open-uri'
require 'json'
require 'pry-byebug'

class PingerJob < ApplicationJob
  queue_as :default

  def perform
    root = Rails.env === 'development' ? 'http://localhost:3000' : 'https://quickreach.herokuapp.com'
    url = "#{root}/api/v1/news"
    json = URI.open(url).read
    data = JSON.parse(json)
  end
end

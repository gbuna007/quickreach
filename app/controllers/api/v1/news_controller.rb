require 'csv'

class Api::V1::NewsController < Api::V1::BaseController
  def index
    filepath = File.join Rails.root, 'public', 'data', "news_api.csv"
    CSV.foreach(filepath, headers: :first_row, liberal_parsing: true) do |row|
      # if news already exist in database (compared through link), then update the breaking to false.
      # if news the link does not match any rec, create a new news instance with default breaking equals to true
      if News.where(link: row["link"]).count > 0
        News.where(link: row["link"]).each do |news|
          news.update(breaking: false)
        end
      else
        news = News.create(title: row["title"], link: row["link"], creator: row["creator"], video_url: row["video_url"], description: row["description"], content: row["content"], pubDate: row["pubDate"].to_date, image_url: row["image_url"], source_id: row["source_id"], full_description: row["full_description"], breaking: true)
      end
    end

    @news = policy_scope(News)
  end
end

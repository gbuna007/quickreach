class Api::V1::NewsController < Api::V1::BaseController
  def index
    filepath = File.join Rails.root, 'public', 'data', "news_api.csv"

    CSV.foreach(filepath, headers: :first_row) do |row|
      news = Account.create(title: row["title"], link: row["link"], keywords: row["keywords"], creator: row["creator"], video_url: row["video_url"], description: row["description"], content: row["content"], pubDate: row["pubDate"], image_url: row["image_url"], source_id: row["source_id"], full_description: row["full_description"])
      # save to db
    end

    @news = policy_scope(News)
  end
end

json.array! @news do |n|
  json.extract! n, :title, :link, :keywords, :creator, :video_url, :description, :content, :pubDate, :image_url, :source_id
end

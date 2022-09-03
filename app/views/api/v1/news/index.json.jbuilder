json.array! @news do |n|
  json.extract! n, :title, :link, :creator, :video_url, :description, :content, :pubDate, :image_url, :source_id
end

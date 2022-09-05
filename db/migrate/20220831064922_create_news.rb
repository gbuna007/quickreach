class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :link
      t.string :creator
      t.string :video_url
      t.string :description
      t.string :content
      t.date :pubDate
      t.string :image_url
      t.string :source_id
      t.string :full_description
      t.boolean :breaking, default: true

      t.timestamps
    end
  end
end

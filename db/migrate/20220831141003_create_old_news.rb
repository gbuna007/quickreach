class CreateOldNews < ActiveRecord::Migration[7.0]
  def change
    create_table :old_news do |t|
      t.string :link

      t.timestamps
    end
  end
end

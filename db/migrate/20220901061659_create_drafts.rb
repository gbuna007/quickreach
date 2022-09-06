class CreateDrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :drafts do |t|
      t.references :trigger, null: false, foreign_key: true
      t.boolean :sent, default: false
      t.string :edited_subject
      t.string :edited_body
      t.references :news, null: false, foreign_key: true

      t.timestamps
    end
  end
end

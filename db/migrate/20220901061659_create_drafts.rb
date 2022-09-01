class CreateDrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :drafts do |t|
      t.references :trigger, null: false, foreign_key: true
      t.references :template, null: false, foreign_key: true
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end

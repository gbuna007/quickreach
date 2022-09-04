class CreateTriggers < ActiveRecord::Migration[7.0]
  def change
    create_table :triggers do |t|
      t.date :date_added
      t.string :name
      t.references :account, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.references :template, null: false, foreign_key: true
      t.timestamps
    end
  end
end

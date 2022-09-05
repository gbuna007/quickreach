class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :name
      t.string :subject
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

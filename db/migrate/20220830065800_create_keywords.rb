class CreateKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :keywords do |t|
      t.string :name
      t.references :trigger, foreign_key: true

      t.timestamps
    end
  end
end

class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :job
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

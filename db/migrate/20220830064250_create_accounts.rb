class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :category
      t.string :status
      t.float :potential_rev
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

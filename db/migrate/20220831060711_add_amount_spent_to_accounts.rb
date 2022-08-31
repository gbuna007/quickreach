class AddAmountSpentToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :amount_spent, :float
  end
end

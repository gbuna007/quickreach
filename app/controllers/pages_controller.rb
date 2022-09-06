require 'csv'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # landing page
  def home
  end

  # new or reintegrate CRM page
  def index
    @user = current_user
  end

  def salesforce
    filepath = File.join Rails.root, 'public', 'data', "accounts.csv"

    CSV.foreach(filepath, headers: :first_row) do |row|
      if Account.where(name: row["name"]).count == 0
        account = Account.new(name: row["name"], category: row["category"], status: row["status"], potential_rev: row["potential_rev"], amount_spent: row["amount_spent"])
        # link the correct user to the account (for the db)
        account.user = current_user
        # save to db
        account.save!
      end

    end
  end
end

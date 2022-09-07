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

    # if the user is reintegrating the CSV
    # destroy all accounts
    # which consequently destroys triggers, drafts, keywords, contacts
    # (don't destroy templates bc they're not tied to a specific account)
    Account.where(user_id: current_user).destroy_all if current_user.accounts.count != 0

    # add the new accounts & contacts
    CSV.foreach(filepath, headers: :first_row) do |row|
      account = Account.new(name: row["name"], category: row["category"], status: row["status"], potential_rev: row["potential_rev"], amount_spent: row["amount_spent"])
      # link the correct user to the account (for the db)
      account.user = current_user
      # save to db
      account.save!
    end
  end
end

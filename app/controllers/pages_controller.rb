require 'csv'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # landing page
  def home
  end

  # new or reintegrate CRM page
  def crm
    @user = current_user
  end

  def salesforce
    filepath = File.join Rails.root, 'public', 'data', "CRM.csv"

    # destroy all accounts
    # which consequently destroys triggers, drafts, keywords, contacts
    # (don't destroy templates bc they're not tied to a specific account)
    Account.where(user_id: current_user).destroy_all

    # add the new accounts & contacts
    CSV.foreach(filepath, headers: :first_row) do |row|
      if Account.where(user_id: current_user, name: row["name"]).empty? # if the account doesn't exist
        # create new account
        account = Account.new(name: row["name"], category: row["category"], status: row["status"], potential_rev: row["potential_rev"], amount_spent: row["amount_spent"])
        # link the user to the account (for the db)
        account.user = current_user
        # save account to db
        account.save!
      else # else find the account
        account = Account.find_by(user_id: current_user, name: row["name"])
      end

      # if the row has a contact
      if row["email"] != ""
        # create a new contact
        contact = Contact.new(email: row["email"], title: row["title"], first_name: row["first_name"], last_name: row["last_name"])
        # link the contact to the account
        contact.account = account
        # save contact to db
        contact.save!
      end
    end
  end
end

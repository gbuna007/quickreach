class AccountsController < ApplicationController
  skip_after_action :verify_authorized, only: [:filter_contacts_by_accounts]

  def index
    @accounts = policy_scope(Account)

    # searchbar
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @accounts = @accounts.where(sql_query, query: "%#{params[:query]}%")
    else
      @accounts = policy_scope(Account)
    end
  end

  def filter_contacts_by_accounts
    @account = Account.find_by_name(params[:account])
    @filtered_contacts = @account.contacts

    respond_to do |format|
      format.json { render json: { contacts: @filtered_contacts } }
    end
  end

  def show
    @account = Account.find(params[:id])
    authorize @account
  end
end

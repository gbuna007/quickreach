class AccountsController < ApplicationController
  def index
    @accounts = policy_scope(Account)

    # searchbar
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @accounts = Account.where(sql_query, query: "%#{params[:query]}%")
    else
      @accounts = policy_scope(Account)
    end
  end

  def show
    @account = Account.find(params[:id])
    authorize @account
  end
end

class AccountsController < ApplicationController
  def index
    @accounts = policy_scope(Account)
  end

  def show
    @account = Account.find(params[:id])
  end
end

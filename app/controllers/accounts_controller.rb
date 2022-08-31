class AccountsController < ApplicationController
  def index
    @accounts = Account.all
    authorize @accounts
  end

  def show
    @account = Account.find(params[:id])
  end
end

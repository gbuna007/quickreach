class AccountsController < ApplicationController
  def index
    @accounts = policy_scope(Account)
    @users = current_user.account
    authorize @user
  end

  def show
    @account = Account.find(params[:id])
  end
end

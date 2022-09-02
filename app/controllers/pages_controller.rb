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
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # landing page
  def home
    redirect_to pages_path if user_signed_in?
  end

  # welcome CRM page
  def index
    redirect_to pages_path unless user_signed_in?
  end
end

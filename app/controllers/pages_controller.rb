class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  # landing page
  def home
  end

  # welcome CRM page
  def index
  end
end

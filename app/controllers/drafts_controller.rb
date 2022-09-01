class DraftsController < ApplicationController
  before_action :set_draft, only: %i[edit show]

  def edit
  end

  private

  def set_draft
    @draft = Draft.find(params[:id])
  end
end

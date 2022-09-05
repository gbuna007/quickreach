class DraftsController < ApplicationController
  before_action :set_draft, only: %i[edit show]

  def index
    @drafts = Draft.all
  end

  def edit
    authorize @draft
  end

  def update
  end

  def destroy
  end

  private

  def set_draft
    @draft = Draft.find(params[:id])
  end
end

class DraftsController < ApplicationController
  # before_action :set_draft, only: %i[index]

  def index
    # @drafts = policy_scope(Draft)
    @drafts = Draft.all
    # @user = @drafts
  end

  # def edit
  #   authorize @draft
  # end

  def update
    @draft.update(draft_params)
    # raise
    authorize @draft
    @draft.save
    if @draft.save
      redirect_to drafts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def draft_params
    params.require(:draft).permit(%i[edited_subject edited_body])
  end

  # def set_draft
  #   @draft = Draft.find(params[:id])
  # end
end

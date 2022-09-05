class DraftsController < ApplicationController
  before_action :set_draft, only: %i[update]

  def index
    @drafts = []
    policy_scope(Draft).each do |draft|
      if draft.trigger.account.user == current_user
        @drafts << draft
      end
    end
  end

  # def edit
  #   authorize @draft
  # end

  def update
    authorize @draft
    @draft.update(draft_params)
    # raise

    @draft.save
    if @draft.save
      redirect_to drafts_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def draft_params
    params.require(:draft).permit(%i[edited_subject edited_body])
  end

  def set_draft
    @draft = Draft.find(params[:id])
  end
end

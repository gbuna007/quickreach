class DraftsController < ApplicationController
  before_action :set_draft, only: %i[update send_draft]

  def index
    @drafts = []
    policy_scope(Draft).each do |draft|
      if draft.trigger.account.user == current_user
        @drafts << draft
      end
    end
  end

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

  def destroy
    @draft = Draft.find(params[:id])
    @draft.destroy
    redirect_to drafts_path, status: :see_other
  end

  def send_draft
    TriggerMailer.send_draft(@draft).deliver_later

    flash[:notice] = "Draft has been sent."
    redirect_to drafts_path
  end

  private

  def draft_params
    params.require(:draft).permit(%i[edited_subject edited_body])
  end

  def set_draft
    @draft = Draft.find(params[:id])
  end
end

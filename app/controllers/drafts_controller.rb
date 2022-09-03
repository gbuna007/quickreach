class DraftsController < ApplicationController
  belongs_to :recipient, class_name: "User"

  after_create_commit :notify_recipient

  before_action :set_draft, only: %i[edit show]

  def edit
    authorize @draft
  end

  def index
  end

  private

  def set_draft
    @draft = Draft.find(params[:id])
  end

  def notify_recipient
    NewMessageNotification.with(message: self).deliver_later(recipient)
  end
end

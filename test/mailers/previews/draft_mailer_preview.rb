class DraftMailerPreview < ActionMailer::Preview
  def new_draft_ready
    DraftMailer.with({ recipient: User.first }).new_draft_ready
  end
end

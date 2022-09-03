class TriggersController < ApplicationController
  def index
    @triggers = policy_scope(Trigger)
    @triggers = Trigger.all

    # new trigger for trigger form
    @trigger = Trigger.new
    # raise
  end

  def create
    @trigger = Trigger.new(trigger_params)
    # @keyword = Keyword.new
    # @trigger.user = current_user
    authorize @trigger
    # set trigger.account and trigger.contact?
    if @trigger.save
      redirect_to triggers_path
      raise
    else
      # render :new, status: :unprocessable_entity
    end
  end

  def update
    @trigger.update(trigger_params)
    @keyword = Keyword.new
    @trigger.user = current_user
    # raise
    authorize @trigger
    @trigger.save
    if @trigger.save
      redirect_to trigger_path(@trigger)
    else
      # render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @trigger = Trigger.find(params[:id])
    @trigger.destroy
    redirect_to triggers_path, status: :see_other
  end

  private

  def trigger_params
    params.require(:trigger).permit(:date_added, :name, :account_id, :contact_id, :keywords, :template_id)
  end

  def keyword_params
    params.require(:keyword).permit(:name)
  end
end

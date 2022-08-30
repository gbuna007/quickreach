class TriggersController < ApplicationController
  def index
    @triggers = Trigger.all
  end

  def create
    @trigger = Trigger.new(trigger_params)
    # set trigger.account and trigger.contact?
    if @trigger.save
      redirect_to triggers_path
    else
      # render :new, status: :unprocessable_entity
    end
  end

  def update
    @trigger = Trigger.find(params[:id])
    if @trigger.update(trigger_params)
      redirect_to triggers_path
    else
      # render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trigger = Trigger.find(params[:id])
    @trigger.destroy
    redirect_to triggers_path, status: :see_other
  end

  private

  def trigger_params
    params.require(:trigger).permit(:date_added, :name, :account_id, :contact_id)
  end
end
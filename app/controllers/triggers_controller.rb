class TriggersController < ApplicationController
  def index
    @triggers = []
    policy_scope(Trigger).each do |trigger|
      if trigger.account.user == current_user
        @triggers << trigger
      end
    end

    # new trigger for trigger form
    @trigger = Trigger.new
    @trigger.keywords.build
  end

  def create
    @trigger = Trigger.new(trigger_params)
    # @trigger.user = current_user
    authorize @trigger

    if @trigger.save
      redirect_to triggers_path
    else
      render 'form2', status: :unprocessable_entity
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
    params.require(:trigger).permit(:date_added, :name, :account_id, :contact_id, :template_id, keywords_attributes: %i[id name _destroy])
  end

end

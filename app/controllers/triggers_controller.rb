class TriggersController < ApplicationController
  before_action :set_trigger, only: %i[update destroy]

  def index
    @triggers = current_user.triggers
    @triggers = @triggers.order('created_at DESC')
    # @triggers = []
    # policy_scope(Trigger).each do |trigger|
    #   if trigger.account.user == current_user
    #     @triggers << trigger
    #   end
    # end

    # filter
    if params[:query].present?
      # raise
      @triggers = Trigger.for_account(params[:query])
      # Trigger.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @triggers
    end

    # if params[:query].present?
    #   sql_query = <<~SQL
    #     trigger.name ILIKE :query
    #     OR account.name ILIKE :query
    #     OR template.name ILIKE :query
    #   SQL
    #   @triggers = Trigger.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @triggers
    # end

    # new trigger for trigger form
    @trigger = Trigger.new
    #@trigger.keywords.build
    @keyword = Keyword.new
  end

  def create
    @trigger = Trigger.new(trigger_params)
    authorize @trigger

    # @trigger.user = current_user
    if @trigger.save
      redirect_to triggers_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  def update
    @trigger.update(trigger_params)
    authorize @trigger

    if @trigger.save
      redirect_to triggers_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  def destroy
    authorize @trigger
    @trigger.destroy
    redirect_to triggers_path, status: :see_other
  end

  private

  def trigger_params
    params.require(:trigger).permit(:name, :account_id, :contact_id, :template_id, keywords_attributes: %i[id name _destroy])
  end

  def set_trigger
    @trigger = Trigger.find(params[:id])
  end
end

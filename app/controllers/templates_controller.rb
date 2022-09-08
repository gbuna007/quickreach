class TemplatesController < ApplicationController
  before_action :set_template, only: %i[update destroy]

  def index
    @templates = policy_scope(Template)
    @templates = @templates.order('created_at DESC')
    # @templates = current_user.templates
    @template = Template.new

  # searchbar
    if params[:query].present?
      sql_query = "name ILIKE :query OR subject ILIKE :query"
      @templates = @templates.where(sql_query, query: "%#{params[:query]}%")
    else
      @templates
    end
  end

  def create
    @template = Template.new(template_params)
    @template.user = current_user
    @template.save
    authorize @template

    respond_to do |format|
      if @template.save
        format.html { redirect_to templates_path }
        # create new template to override in create.json.jbuilder => not sure why we have to do this..
        @new_template = Template.new
        # if the format is html, do this
      else
        format.html { render "templates/index", status: :unprocessable_entity }
      end

      # format should be json so so the program should always hit this line
      # then go to create.json.jbuilder
      format.json
    end
  end

  def show
    authorise @template
    redirect_to templates_path
  end

  def update
    authorize @template
    @template.update(template_params)

    if @template.save
      redirect_to templates_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  def destroy
    authorize @template
    @template.destroy
    redirect_to templates_path, status: :see_other
  end

  private

  def template_params
    params.require(:template).permit(:name, :subject, :body, :user_id)
  end

  def set_template
    @template = Template.find(params[:id])
  end
end

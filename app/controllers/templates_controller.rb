class TemplatesController < ApplicationController
  def index
    @templates = policy_scope(Template)
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
    authorize @template

    respond_to do |format|
      if @template.save
        # create new template to override in create.json.jbuilder => not sure why we have to do this..
        @new_template = Template.new
        # if the format is html, do this
        format.html { redirect_to templates_path }
      else
        format.html { render "templates/index", status: :unprocessable_entity }
      end

      # format should be json so so the program should always hit this line
      # then go to create.json.jbuilder
      format.json
    end
  end

  def show
    redirect_to templates_path
  end

  def update
    @template = Template.find(params[:id])
    @template.update(template_params)
    authorize @template

    index
    if @template.save
      redirect_to templates_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  def destroy
    @template = Template.find(params[:id])
    authorize @template
    @template.destroy
    redirect_to templates_path, status: :see_other
  end

  private

  def template_params
    params.require(:template).permit(:name, :subject, :body, :user_id)
  end
end

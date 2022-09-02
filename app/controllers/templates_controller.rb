class TemplatesController < ApplicationController
  def index
    @templates = policy_scope(Template)
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    authorize @template
    @template.user = current_user
    @template.save

    respond_to do |format|
      format.html { redirect_to templates_path }
      format.text { render partial: "templates/template_rows", locals: { templates: @templates }, formats: [:html] }
    end
  end

  private

  def template_params
    params.require(:template).permit(:name, :subject, :body)
  end
end

class TemplatesController < ApplicationController
  def index
    @templates = policy_scope(Template)
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    authorize @template
    @template.user = current_user

    respond_to do |format|
      if @template.save
        format.html { redirect_to templates_path }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "templates/index", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def template_params
    params.require(:template).permit(:name, :subject, :body)
  end
end

class TemplatesController < ApplicationController
  skip_after_action :verify_authorized, only: :show
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
      else
        format.html { render "templates/index", status: :unprocessable_entity }
      end
      format.json
    end
  end

  def show
    redirect_to templates_path
  end

  private

  def template_params
    params.require(:template).permit(:name, :subject, :body)
  end
end

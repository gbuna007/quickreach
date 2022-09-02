class TemplatesController < ApplicationController
  def index
    @templates = policy_scope(Template)
    @template = Template.new
  end
end

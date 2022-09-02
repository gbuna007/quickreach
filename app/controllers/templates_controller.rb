class TemplatesController < ApplicationController
  def index
    @templates = policy_scope(Template)
  end
end

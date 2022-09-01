class Api::V1::NewsController < Api::V1::BaseController
  def index
    @news = policy_scope(News)
  end
end

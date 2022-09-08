class KeywordsController < ApplicationController
  def create
    @keyword = Keyword.new(keyword_params)
    authorize @keyword
    @keyword.save
    # respond_to do |format|
    #   format.json
    # end
  end

  private

  def keyword_params
    params.require(:keyword).permit(:name)
  end
end

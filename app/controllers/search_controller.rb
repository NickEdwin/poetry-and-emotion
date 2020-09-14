class SearchController < ApplicationController

  def index
    # The controller is responsible for being the go-between
    # It asks for info & gives the return to the view
    search = SearchFacade.new(params[:author])
    @poems = search.poems
  end
end

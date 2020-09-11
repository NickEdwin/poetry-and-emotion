class SearchController < ApplicationController

  def index
    @poems = Author.author(params[:author]).first(10)

    searches = []
    @poems.each do |poem|
      searches << poem.lines.join(" ")
    end

    searches.each do |search|
      @emotions = Emotion.emotion(search)
    end
    
    @emotions
    require"pry"; binding.pry
  end
end

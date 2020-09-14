# The facade is resposible for getting data from the service & turning that info into objects

class SearchFacade

  def initialize(author)
    @author = author
  end

# This method should create the poem objects with poem data and tones
  def poems
    poem_info.map do |poem|
      poem[:lines] = poem[:lines].join(" ")
      tones = emotions(poem[:lines])
      # Rename the Author class to Poem for clarity
      Author.new(poem, tones)
    end
  end

# This method is responsible for getting the poems
  def poem_info
    poem_service.author(@author).first(10)
  end

# This method is responsible for getting the tones associated to a poem
  def emotions(text)
    emotion_service.emotion(text)
  end

  private
  # These are private methods because we shouldn't need access to them outside of this class
    def poem_service
      # Rename Service to PoetryService for clarity
      poem_service = AuthorService.new
    end

    def emotion_service
      EmotionService.new
    end
end

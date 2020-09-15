# Rename to Poem for clarity
class Author
  attr_reader :author,
              :title,
              :lines,
              :tones

  def initialize(poem_info, tones)
    @author = poem_info[:author]
    @title = poem_info[:title]
    @lines = poem_info[:lines]
    # Tones should equal all the tones that are returned from the API
    @tones
  end
end

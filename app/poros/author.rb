class Author

  def self.author(name)
    poem_service = AuthorService.new
    poem_info = poem_service.author(name)

    @poems = poem_info.map do |poem|
      Author.new(poem)
    end
  end

  attr_reader :author,
              :title,
              :lines

  def initialize(poem_info)
    @author = poem_info[:author]
    @title = poem_info[:title]
    @lines = poem_info[:lines]
  end

end

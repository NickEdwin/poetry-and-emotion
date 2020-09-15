# Rename to PoetryService for clarity
class AuthorService
  def author(name)
    poems = conn.get("/author/#{name}")
    JSON.parse(poems.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://poetrydb.org")
  end
end

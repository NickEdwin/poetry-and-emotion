class EmotionService
  def emotion(words)
    response = conn.get("/#{ENV['IBM_API_KEY']}/v3/tone?version=2017-09-21&text=#{words}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances")
  end
end

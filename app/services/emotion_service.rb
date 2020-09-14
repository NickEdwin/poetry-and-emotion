class EmotionService
  def emotion(words)
    # Use a block to help with readability of params
    response = conn.get("/v3/tone") |req| do
      req.params[:version] = '2017-09-21'
      req.params[:text] = words
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  # Need to include the basic auth in the connection block for authorization to this API
  def conn
    Faraday.new("https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances") do |connection|
      # apikey is the username and the password is the the api key value
      connection.basic_auth('apikey', ENV['TONE_KEY'])
  end
end

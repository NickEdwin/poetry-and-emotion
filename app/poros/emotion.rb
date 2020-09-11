class Emotion

  def self.emotion(words)
    emotion_service = EmotionService.new
    emotion_info = emotion_service.emotion(words)

    @emotions = emotion_info.map do |emotion|
      Emotion.new(emotion)
    end
  end

  attr_reader :tones

  def initialize(emotion_info)
    require"pry"; binding.pry
    @tones = emotion_info[:document_tone][:tones][:tone_name]
  end
end

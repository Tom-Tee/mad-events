# require_relative '../models/event'
# require_relative '../models/speaker'
# require_relative '../models/talk'

class Controller

  def initialize(talk_repository, event_repository, speaker_repository)
    @talk_repository = talk_repository
    @speaker_repository = speaker_repository
    @event_repository = event_repository
    @view = View.new
  end

  def add_event(input)
    @create_event_or_speaker(input)
    event = Event.new(input)
  end

end

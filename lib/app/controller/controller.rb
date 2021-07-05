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

  def add_event
    name = @view.name_of_event_or_speaker("EVENT")
    event = Event.new(name: name)
    @event_repository.create(event)
  end

  def add_speaker
    name = @view.name_of_event_or_speaker("SPEAKER")
    event = Speaker.new(name: name)
    @event_repository.create(event)
  end
end

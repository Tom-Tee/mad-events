# require_relative '../models/event'
# require_relative '../models/speaker'
# require_relative '../models/talk'
require_relative '../view/view'

class Controller
  def initialize(talk_repository, event_repository, speaker_repository)
    @talk_repository = talk_repository
    @speaker_repository = speaker_repository
    @event_repository = event_repository
    @view = View.new
  end

  def list_all_events
    events = @event_repository.all
    @view.show_all_events(events)
  end

  def add_event(choice)
    # name = @view.name_of_event_or_speaker("EVENT")
    event = Event.new(name: choice)
    @event_repository.create(event)
    @view.event_created(choice)
  end


  def add_speaker(choice)
    speaker = Speaker.new(name: choice)
    @speaker_repository.create(speaker)
    @view.event_created(choice)
  end
end

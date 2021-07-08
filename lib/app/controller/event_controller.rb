require_relative '../view/event_view'
require_relative '../models/event'

class EventController
  def initialize(event_repository)
    @event_repository = event_repository
    @event_view = EventView.new
  end

  def list_all_events
    events = @event_repository.all
    @event_view.show_all_events(events)
  end

  def add_event(choice)
    event = Event.new(name: choice)
    @event_repository.create(event)
    @event_view.event_created(choice)
  end
end

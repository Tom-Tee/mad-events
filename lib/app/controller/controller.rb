# require_relative '../models/event'
# require_relative '../models/speaker'
# require_relative '../models/talk'
require_relative '../view/view'
require 'tod'

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

  def list_all_speakers
    speakers = @speaker_repository.all
    @view.show_all_speakers(speakers)
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
    @view.speaker_created(choice)
  end

  def add_talk(choice)
    regex = regex = /([a-zA-Z_\s()]*) (['a-zA-Z\s']*) ([\d{2}:am||pm]*) ([\d{2}:am||pm]*) ([a-zA-Z]*)/
    match_regex = choice.match(regex)
    if match_regex != nil
      event = @event_repository.find_event_by_name(match_regex[1])
      speaker = @speaker_repository.find_speaker_by_name(match_regex[5])
      start_time =  Tod::TimeOfDay.parse "#{match_regex[3]}"
      end_time = Tod::TimeOfDay.parse "#{match_regex[4]}"
      talk_name = "#{match_regex[2].delete("'")}"
      new_talk = Talk.new(name: talk_name, event: event, speaker: speaker, start_time: start_time, end_time: end_time)
      binding.pry
    end
    # @view.must_be_correct if split_choice == nil
  end
end

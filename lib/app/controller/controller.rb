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

  def add_event(choice)
    # name = @view.name_of_event_or_speaker("EVENT")
    event = Event.new(name: choice)
    @event_repository.create(event)
        system 'clear'
    @view.event_created(choice)
  end

  def add_speaker(choice)
    speaker = Speaker.new(name: choice)
    @speaker_repository.create(speaker)
    system 'clear'
    @view.speaker_created(choice)
  end

  def list_all_speakers
    speakers = @speaker_repository.all
    @view.show_all_speakers(speakers)
  end

  def list_all_talks(event)
    all_talks = @talk_repository.search_for_talk(event)
    all_talks.sort_by! {|talk| talk.start_time }
    # binding.pry
    all_talks.each do |talk|
      talk_name = talk.name
      speaker_name = talk.speaker.name
      start_time = talk.start_time
      end_time = talk.end_time
      @view.show_all_talks(talk_name, start_time, end_time, speaker_name)
    end
    @view.show_all_talks(talks)
  end


  # def search_for_start_time

  # end

  def add_talk(match_array)
    event = @event_repository.find_event_by_name(match_array[1])
    speaker = @speaker_repository.find_speaker_by_name(match_array[5])
    start_time =  Tod::TimeOfDay.parse "#{match_array[3]}"
    end_time = Tod::TimeOfDay.parse "#{match_array[4]}"
    talk_name = "#{match_array[2].delete("'")}"
    new_talk = Talk.new(name: talk_name, event: event, speaker: speaker, start_time: start_time, end_time: end_time)

    search_talks = @talk_repository.search_for_talk(new_talk.event.name)

    if search_talks == []
      @talk_repository.create(new_talk)
      system 'clear'
      @view.talk_created(match_array[2], match_array[1], match_array[3], match_array[4],match_array[5])
    elsif check_time(new_talk, search_talks)
      puts "there is already a talk at that time, please choose another"
    else
      @talk_repository.create(new_talk)
      system 'clear'
      @view.talk_created(match_array[2], match_array[1], match_array[3], match_array[4],match_array[5])
    end
  end

  def check_time(talk, talk_repo)
    talk_start_time = (talk.start_time.second_of_day+1)
    talk_end_time = (talk.end_time.second_of_day-1)
    talk_repo_start = (talk_repo[0].start_time.second_of_day+1)
    talk_repo_end = (talk_repo[0].end_time.second_of_day-1)
    talk_start_time.between?(talk_repo_start, talk_repo_end) || talk_end_time.between?(talk_repo_start, talk_repo_end)
    # talk_repo[0].start_time <= talk.start_time && talk_repo[0].end_time <= talk.end_time
  end

end

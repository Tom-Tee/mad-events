require_relative '../view/talk_view'
require 'time'
require 'tod'

class TalkController
  def initialize(talk_repository, speaker_repository, event_repository)
    @talk_repository = talk_repository
    @speaker_repository = speaker_repository
    @event_repository = event_repository
    @view = TalkView.new
  end

  def split_talk_data(match_array)
    event = @event_repository.find_event_by_name(match_array[1])
    return @view.event_not_found if event.nil?

    speaker = @speaker_repository.find_speaker_by_name(match_array[5])
    return @view.speaker_not_found if speaker.nil?

    begin
    start_time = Tod::TimeOfDay.parse "#{match_array[3]}"
    end_time = Tod::TimeOfDay.parse "#{match_array[4]}"
    rescue; puts "Invalid time of day"; return; end
    talk_name = "#{match_array[2].delete("'")}"
    add_talk([talk_name, event, start_time, end_time, speaker])
  end

  def add_talk(talk_data)
    new_talk = Talk.new(name: talk_data[0], event: talk_data[1], speaker: talk_data[4], start_time: talk_data[2], end_time: talk_data[3])
    search_talks = @talk_repository.search_for_talk(new_talk.event.name)
    if check_if_time_is_taken(new_talk, search_talks) == true
      @view.already_a_talk
    else
      @talk_repository.create(new_talk)
      @view.talk_created(talk_data[0], talk_data[1].name, convert_time(talk_data[2]), convert_time(talk_data[3]), talk_data[4].name)
    end
  end

  def check_if_time_is_taken(talk, talk_repo)
    talk_start_time = (talk.start_time.second_of_day+1)
    talk_end_time = (talk.end_time.second_of_day-1)
    talk_repo.each do |talk_selection|
      talk_repo_start = (talk_selection.start_time.second_of_day+1)
      talk_repo_end = (talk_selection.end_time.second_of_day-1)
      comparison = talk_start_time.between?(talk_repo_start, talk_repo_end) || talk_end_time.between?(talk_repo_start, talk_repo_end)
      return true if comparison == true
    end
  end

  def print_talks(event)
    all_talks = @talk_repository.search_for_talk(event)
    return @view.event_not_found if all_talks == []
    all_talks.sort_by! { |talk| talk.start_time }
    all_talks.each do |talk|
      talk_name = talk.name
      speaker_name = talk.speaker.name
      start_time = talk.start_time
      end_time = talk.end_time
      @view.show_all_talks(talk_name, convert_time(start_time), convert_time(end_time), speaker_name)
    end
  end

  def convert_time(time)
    Time.parse("#{time.hour} : #{time.minute}").strftime("%I%M%P")
  end
end

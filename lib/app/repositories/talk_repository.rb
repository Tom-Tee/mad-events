require_relative '../models/event'
require_relative '../models/speaker'
require_relative '../models/talk'
require 'csv'
require 'tod'

class TalkRepository
  def initialize(csv_file, event_repository, speaker_repository)
    @csv_file = csv_file
    @event_repository = event_repository
    @speaker_repository = speaker_repository
    @talks = []
    load_csv
  end

  def all
    @talks
  end

  def create(talk)
    @talks << talk
    # save csv?
  end

  def search_for_talk(event)
    @talks.select {|talk| talk.event.name == event }
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name]= row[:name].to_s
      row[:event] = @event_repository.find_event_by_id(row[:event_id].to_i)
      row[:speaker] = @speaker_repository.find_speaker_by_id(row[:speaker_id].to_i)
      row[:start_time] = Tod::TimeOfDay.parse "#{row[:start_time]}"
      row[:end_time] = Tod::TimeOfDay.parse "#{row[:end_time]}"
      @talks << Talk.new(row)
      # binding.pry
    end
  end
end

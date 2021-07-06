require_relative '../models/event'
require_relative '../models/speaker'
require_relative '../models/talk'
require 'csv'

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
    # talk.id = @next_id
    @talks << talk
    # @next_id += 1
    # save csv?
  end

  def search_for_talk(event)
    @talks.select {|talk| talk.event.name == event }
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name]= row[:id].to_s
      # binding.pry
      row[:event] = @event_repository.find_event_by_id(row[:event_id].to_i)
      row[:speaker] = @speaker_repository.find_speaker_by_id(row[:speaker_id].to_i)
      row[:start_time] = Time.now
      row[:end_time] = Time.now
      @talks << Talk.new(row)
    end
  end

end

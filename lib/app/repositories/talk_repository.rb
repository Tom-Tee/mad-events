require_relative '../models/event'
require_relative '../models/speaker'
require_relative '../models/talk'

class TalkRepository

  def initialize(csv_file, event_repository, speaker_repository)
    @csv_file = csv_file
    @event_repository = event_repository
    @speaker_repository = speaker_repository
    @talks = []
    @csv_file if File.exist?(@csv_file)
    load_csv
            # binding.pry
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:event] = @event_repository.find_event(row[:event_id].to_i)
      row[:speaker] = @speaker_repository.find_speaker(row[:speaker_id].to_i)
      row[:start_time] = Time.now
      row[:end_time] = Time.now
      @talks << Talk.new(row[:event], row[:speaker], row[:start_time], row[:end_time], row[:id])
    end
    # @next_id = @orders.last.id + 1 unless @orders.empty?
  end

end

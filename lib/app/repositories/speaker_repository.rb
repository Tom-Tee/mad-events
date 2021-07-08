require 'pry'
require_relative '../models/speaker'
require 'csv'

class SpeakerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @speakers = []
    @next_id = 1
    load_csv
  end

  def all
    @speakers
  end

  def find_speaker_by_id(id)
    @speakers.find { |speaker| speaker.id == id }
  end

  def find_speaker_by_name(name)
    @speakers.find { |speaker| speaker.name == name }
  end

  def create(speaker)
    speaker.id = @next_id
    @speakers << speaker
    @next_id += 1
    # save csv?
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name].to_s
      @speakers << Speaker.new(row)
    end
    @next_id = @speakers.last.id + 1 unless @speakers.empty?
  end
end

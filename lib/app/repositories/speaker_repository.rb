require 'pry'
require 'csv'
require_relative '../models/speaker'

class SpeakerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @speakers = []
    load_csv if File.exist?(@csv_file)
    # binding.pry
  end

  def all
    @speakers
  end

  def find_speaker(id)
    @speakers.find { |event| event.id == id }
  end


  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      # binding.pry
      row[:id] = row[:id].to_i
      row[:name] = row[:name].to_s
      @speakers << Speaker.new(row[:name], row[:id])
    end
  end
end

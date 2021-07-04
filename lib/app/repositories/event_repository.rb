require 'pry'
require 'csv'
require_relative '../models/event'

class EventRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @events = []
    load_csv if File.exist?(@csv_file)
    # binding.pry
  end

  def all
    @events
  end

  def find_payment(input)
    @events.select { |event| event.name == input }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name].to_s
      @events << Event.new(row[:name], row[:id])
    end
  end
end

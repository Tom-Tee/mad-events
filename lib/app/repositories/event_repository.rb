require 'pry'
require_relative '../models/event'
require 'csv'

class EventRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @events = []
    @next_id = 1
    load_csv
  end

  def create(event)
    event.id = @next_id
    @events << event
    @next_id += 1
    # save_csv ???
  end

  def all
    @events
  end

  def find_event_by_id(id)
    @events.find { |event| event.id == id }
  end

  def find_event_by_name(name)
    @events.find { |event| event.name == name }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name].to_s
      @events << Event.new(row)
    end
    @next_id = @events.last.id + 1 unless @events.empty?
  end
end

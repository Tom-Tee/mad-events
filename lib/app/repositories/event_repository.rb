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

  def create(customer)
    customer.id = @next_id
    @events << event
    @next_id += 1
    save_csv
  end

  def all
    @events
  end

  def find_event(id)
    @events.find { |event| event.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name].to_s
      @events << Event.new(row)
      # binding.pry
    end
  end
end

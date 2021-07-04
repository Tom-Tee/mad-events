require_relative "support/csv_helper"

begin
  require_relative "../lib/app/repositories/event_repository"
rescue LoadError => e
  if e.message =~ /event_repository/
    describe "Event" do
      it "You need a `event_repository.rb` file for `EventRepository` class" do
        fail
      end
    end
  else
    raise e
  end
end

describe EventRepository, :event do
    let(:events) do
    [
      [ 'id', 'name' ],
      [ 1, 'Hybrid Melbourne Showcase' ],
      [ 2, 'Partnering to End Modern Slavery' ]
    ]
  end

  let(:csv_path) { "spec/support/events.csv" }

  before(:each) do
    CsvHelper.write_csv(csv_path, events)
  end

    def elements(repo)
      repo.instance_variable_get(:@events)
    end

    describe "#initialize" do
      it "should take one argument: the CSV file path for events" do
        expect(EventRepository.instance_method(:initialize).arity).to eq(1)
      end

      it "should store events in memory in an instance variable `@events`" do
        repo = EventRepository.new(csv_path)
        expect(elements(repo)).to be_a(Array)
      end

      it "should load existing events from the CSV" do
        repo = EventRepository.new(csv_path)
        events = elements(repo) || []
        expect(events.length).to eq(2)
      end

      it "should fill the `@events` with instances of `Event`, setting the correct types on each property" do
        repo = EventRepository.new(csv_path)
        loaded_events = elements(repo) || []
        fail if loaded_events.empty?
        loaded_events.each do |event|
          expect(event).to be_a(Event)
          expect(event.name).to be_a(String)
          expect(event.id).to be_a(Integer)
        end
      end
    end
  end

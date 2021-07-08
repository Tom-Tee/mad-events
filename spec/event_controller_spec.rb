begin
  require_relative "../lib/app/controller/event_controller"
  require_relative "../lib/app/repositories/event_repository"
rescue LoadError => e
  if e.message =~ /order/
    describe "Event" do
      it "You need a `event_controller.rb` file for `EventController` model" do
        fail
      end
    end
  else
    raise e
  end
end

describe EventController, :event do
    let(:events) do
    [
      [ 'id', 'name' ],
      [ 1, 'Hybrid Melbourne Showcase' ],
      [ 2, 'Partnering to End Modern Slavery' ]
    ]
  end

  let(:csv_path) { "spec/support/events.csv" }
  let(:event_repository) { EventRepository.new(csv_path) }
  let(:event_controller) { EventController.new(event_repository)}
  # let(:repository_amount) { event_repository.all.length }


  before(:each) do
    CsvHelper.write_csv(csv_path, events)
  end

    describe "#initialize" do
      it "should be initialized with a `EventRepository` instance" do
        expect(EventController.instance_method(:initialize).arity).to eq(1)
      end
    end

    describe "#add_event" do
      it "should add an event to the event repository" do
        event_controller.add_event("new_event")
        expect(event_repository.all.length).to be > 2
      end
    end
end

begin
  require_relative "../lib/app/controller/event_controller"
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

  before(:each) do
    CsvHelper.write_csv(csv_path, events)
  end

    describe "#initialize" do
      it "should be initialized with a `EventRepository` instance" do
        expect(EventRepository.instance_method(:initialize).arity).to eq(1)
      end
    end
end

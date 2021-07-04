begin
  require_relative "../lib/app/models/event"
rescue LoadError => e
  if e.message =~ /order/
    describe "Event" do
      it "You need a `event.rb` file for `Event` model" do
        fail
      end
    end
  else
    raise e
  end
end

describe Event do
  let(:event_class) { Event.new("Hybrid Melbourne Showcase", 1) }

  it "should be initialized with a name" do
    expect(event_class).to be_a(Event)
  end

  it "should return the name of Event class" do
    expect(event_class.name).to eq("Hybrid Melbourne Showcase")
  end
end

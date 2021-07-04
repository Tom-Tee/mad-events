begin
  require_relative "../lib/models/event"
rescue LoadError => e
  if e.message =~ /order/
    describe "Event" do
      it "You need a `beverage.rb` file for `Event` model" do
        fail
      end
    end
  else
    raise e
  end
end

describe Event do
  let(:event_class) { Event.new("EmTech Europe") }

  it "should be initialized with a name" do
    expect(event_class).to be_a(Event)
  end

  it "should return the name of Event class" do
    expect(event_class.name).to eq("EmTech Europe")
  end
end

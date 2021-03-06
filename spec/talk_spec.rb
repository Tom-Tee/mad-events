begin
  require_relative "../lib/app/models/talk"
  require_relative "../lib/app/models/speaker"
  require_relative "../lib/app/models/event"
rescue LoadError => e
  if e.message =~ /order/
    describe "Talk" do
      it "You need a `talk.rb` file for `Speaker` model" do
        fail
      end
    end
  else
    raise e
  end
end

describe Talk do
  let(:event_class) { Event.new(hash = {name: "Hybrid Melbourne Showcase", id: 1 }) }
  let(:speaker_class) { Speaker.new(hash = {name: "Jacqui Cooper", id: 1} ) }
  let(:talk_class) { Talk.new(hash = {event: event_class, speaker: speaker_class, start_time: Time.at(14000000000), end_time: Time.at(15000000000) } ) }

  it "should be initialized with an event, speaker, start_time, end_time" do
    expect(talk_class).to be_a(Talk)
  end

  it "should return the Event of Talk class" do
    expect(talk_class.event).to eq(event_class)
  end

  it "should return the Speaker of Talk class" do
    expect(talk_class.speaker).to eq(speaker_class)
  end

  it "should return the start time of Talk class" do
    expect(talk_class.start_time).to eq(Time.at(14000000000))
    expect(talk_class.start_time).to be_a(Time)
  end

  it "should return the end time of Talk class" do
    expect(talk_class.end_time).to eq(Time.at(15000000000))
    expect(talk_class.end_time).to be_a(Time)
  end
end

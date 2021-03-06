begin
  require_relative "../lib/app/models/speaker"
rescue LoadError => e
  if e.message =~ /order/
    describe "Event" do
      it "You need a `speaker.rb` file for `Speaker` model" do
        fail
      end
    end
  else
    raise e
  end
end

describe Speaker do
  let(:speaker_class) { Speaker.new(hash = {name: "Jacqui Cooper", id: 2}) }

  it "should be initialized with a hash of properties" do
    expect(speaker_class).to be_a(Speaker)
  end

  it "should return the name of Speaker class" do
    expect(speaker_class.name).to eq("Jacqui Cooper")
  end
end

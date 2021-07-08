begin
  require_relative "../lib/app/controller/speaker_controller"
  require_relative "../lib/app/repositories/speaker_repository"
rescue LoadError => e
  if e.message =~ /order/
    describe "Event" do
      it "You need a `speaker_controller.rb` file for `SpeakerController` model" do
        fail
      end
    end
  else
    raise e
  end
end

describe EventController, :event do
    let(:speakers) do
    [
      [ 'id', 'name' ],
      [ 1, 'Jacqui Cooper' ],
      [ 2, 'Chyloe Kurdas' ]
    ]
  end

  let(:csv_path) { "spec/support/speakers.csv" }
  let(:speaker_repository) { SpeakerRepository.new(csv_path) }
  let(:speaker_controller) { SpeakerController.new(speaker_repository)}
  # let(:repository_amount) { event_repository.all.length }


  before(:each) do
    CsvHelper.write_csv(csv_path, speakers)
  end

    describe "#initialize" do
      it "should be initialized with a `SpeakerRepository` instance" do
        expect(SpeakerController.instance_method(:initialize).arity).to eq(1)
      end
    end

    describe "#add_event" do
      it "should add an event to the speaker repository" do
        speaker_controller.add_speaker("John")
        expect(speaker_repository.all.length).to be > 2
      end
    end
end

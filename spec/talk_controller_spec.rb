begin
  require_relative "../lib/app/controller/talk_controller"
  require_relative "../lib/app/repositories/talk_repository"
  require_relative "../lib/app/repositories/event_repository"
  require_relative "../lib/app/repositories/speaker_repository"
rescue LoadError => e
  if e.message =~ /order/
    describe "Talk" do
      it "You need a `talk_controller.rb` file for `TalkController` model" do
        fail
      end
    end
  else
    raise e
  end
end

describe TalkController, :talk do

    let(:speakers) do
    [
      [ "id", "name" ],
      [ 1, 'Jacqui Cooper' ],
      [ 2, 'Chyloe Kurdas' ],
      [ 3, 'John']
    ]
    end

    let(:events) do
    [
      [ 'id', 'name' ],
      [ 1, 'Hybrid_Melbourne_Showcase' ],
      [ 2, 'Partnering_to_End_Modern_Slavery' ]
    ]
    end

    let(:talks) do
    [
      ["id", "name", "event_id", "speaker_id", "start_time", "end_time"],
      [1,'A Champion Attiude',1,1,'7:00am','7:20am']
    ]
    end

    let(:events_csv_path) { "spec/support/events.csv" }
    let(:speaker_csv_path) { "spec/support/speaker.csv" }
    let(:talk_csv_path) { "spec/support/talk.csv" }

  # let(:csv_path) { "spec/support/talks.csv" }
  let(:event_repository) { EventRepository.new(events_csv_path) }
  let(:speaker_repository) { SpeakerRepository.new(speaker_csv_path) }
  let(:talk_repository) { TalkRepository.new(talk_csv_path, event_repository, speaker_repository) }
  let(:talk_controller) { TalkController.new(talk_repository, speaker_repository, event_repository)}
  # let(:repository_amount) { talk_repository.all.length }

    before(:each) do
      CsvHelper.write_csv(events_csv_path, events)
      CsvHelper.write_csv(talk_csv_path, talks)
      CsvHelper.write_csv(speaker_csv_path, speakers)
    end

    describe "#initialize" do
      it "should be initialized with a `talkRepository` instance" do
        expect(TalkController.instance_method(:initialize).arity).to eq(3)
      end
    end

    describe "#add_talk" do
      it "should add a talk to the talk repository" do
        choice = "Hybrid_Melbourne_Showcase 'working with arrays' 7:30am 8:00am John"
        regex = /([a-zA-Z_\s()]*) (['a-zA-Z\s']*) ([\d{2}:am||pm]*) ([\d{2}:am||pm]*) ([a-zA-Z]*)/
        match_regex = choice.match(regex)
        talk_controller.split_talk_data_from_regex(match_regex)
        expect(talk_repository.all.length).to eq(2)
      end
    end
end

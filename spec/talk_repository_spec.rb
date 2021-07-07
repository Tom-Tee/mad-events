require_relative "support/csv_helper"
require 'tod'
require 'time'

begin
  require_relative "../lib/app/repositories/talk_repository"
  require_relative "../lib/app/repositories/speaker_repository"
  require_relative "../lib/app/repositories/event_repository"
rescue LoadError => e
  if e.message =~ /talk_repository/
    describe "speaker" do
      it "You need a `speaker_repository.rb` file for `TalkRepository` class" do
        fail
      end
    end
  else
    raise e
  end
end

describe TalkRepository, :talk do
    let(:talks) do
    [

      ["id", "name", "event_id", "speaker_id", "start_time", "end_time"],
      [1,'A Champion Attiude',1,1,'7:00am','7:20am']
    ]
    end

    let(:speakers) do
    [
      [ "id", "name" ],
      [ 1, 'Jacqui Cooper' ],
      [ 2, 'Chyloe Kurdas' ]
    ]
    end

    let(:events) do
    [
      [ 'id', 'name' ],
      [ 1, 'Hybrid Melbourne Showcase' ],
      [ 2, 'Partnering to End Modern Slavery' ]
    ]
    end

    let(:events_csv_path) { "spec/support/events.csv" }
    let(:speaker_csv_path) { "spec/support/speaker.csv" }
    let(:talk_csv_path) { "spec/support/talk.csv" }

    before(:each) do
      CsvHelper.write_csv(events_csv_path, events)
      CsvHelper.write_csv(talk_csv_path, talks)
      CsvHelper.write_csv(speaker_csv_path, speakers)
    end

    def elements(repo)
      repo.instance_variable_get(:@talks)
    end

    let(:speaker_repo) { SpeakerRepository.new(speaker_csv_path) }
    let(:event_repo) { EventRepository.new(events_csv_path) }
    let(:talk_repo) { TalkRepository.new(talk_csv_path, event_repo, speaker_repo) }

    describe "#initialize" do
      it "should take three arguments: the CSV file path for talks, the speakers repository and the events repository" do
        expect(TalkRepository.instance_method(:initialize).arity).to eq(3)
      end
      it "should store talks in memory in an instance variable `@talks`" do
        expect(elements(talk_repo)).to be_a(Array)
      end
  end

      it "should load existing speakers from the CSV" do
        talks = elements(talk_repo) || []
        expect(talks.length).to eq(1)
      end

      it "should fill the `@talks` with instances of `Talk`, setting the correct types on each property" do
        loaded_talks = elements(talk_repo) || []
        time_value = Tod::TimeOfDay
        fail if loaded_talks.empty?
        loaded_talks.each do |talk|
          expect(talk).to be_a(Talk)
          expect(talk.event).to be_a(Event)
          expect(talk.speaker).to be_a(Speaker)
          expect(talk.start_time.second_of_day).to be_a(Integer)
          expect(talk.end_time.second_of_day).to be_a(Integer)
        end
      end
end

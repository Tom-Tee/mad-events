require_relative "support/csv_helper"

begin
  require_relative "../lib/app/repositories/speaker_repository"
rescue LoadError => e
  if e.message =~ /speaker_repository/
    describe "speaker" do
      it "You need a `speaker_repository.rb` file for `SpeakerRepository` class" do
        fail
      end
    end
  else
    raise e
  end
end

describe SpeakerRepository, :speaker do
    let(:speakers) do
    [
      [ "id", "name" ],
      [ 1, 'Jacqui Cooper' ],
      [ 2, 'Chyloe Kurdas' ]
    ]
  end

  let(:csv_path) { "spec/support/speaker.csv" }

  before(:each) do
    CsvHelper.write_csv(csv_path, speakers)
  end

    def elements(repo)
      repo.instance_variable_get(:@speakers)
    end

    describe "#initialize" do
      it "should take one argument: the CSV file path for speakers" do
        expect(SpeakerRepository.instance_method(:initialize).arity).to eq(1)
      end

      it "should store speakers in memory in an instance variable `@speakers`" do
        repo = SpeakerRepository.new(csv_path)
        expect(elements(repo)).to be_a(Array)
      end

      it "should load existing speakers from the CSV" do
        repo = SpeakerRepository.new(csv_path)
        speakers = elements(repo) || []
        expect(speakers.length).to eq(2)
      end

      it "should fill the `@speakers` with instances of `Speaker`, setting the correct types on each property" do
        repo = SpeakerRepository.new(csv_path)
        loaded_speakers = elements(repo) || []
        fail if loaded_speakers.empty?
        loaded_speakers.each do |speaker|
          expect(speaker).to be_a(Speaker)
          expect(speaker.name).to be_a(String)
        end
      end
    end
  end

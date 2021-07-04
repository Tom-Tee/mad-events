require_relative '../models/event'
require_relative '../models/speaker'
require_relative '../models/talks'

class TalkRepository

  def initialize(csv_file event_repository, speaker_repository)
    @event_repository = event_repository
    @speaker_repository = speaker_repository
    @talks = []
    @csv_file if File.exist?(@csv_file)
  end



end

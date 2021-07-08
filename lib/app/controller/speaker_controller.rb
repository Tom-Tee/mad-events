require_relative '../view/speaker_view'

class SpeakerController
  def initialize(speaker_repository)
    @speaker_repository = speaker_repository
    @speaker_view = SpeakerView.new
  end

  def add_speaker(choice)
    speaker = Speaker.new(name: choice)
    @speaker_repository.create(speaker)
    @speaker_view.speaker_created(choice)
  end

  def list_all_speakers
    speakers = @speaker_repository.all
    @speaker_view.show_all_speakers(speakers)
  end
end

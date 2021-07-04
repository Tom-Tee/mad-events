class Talk
  attr_reader :event, :speaker, :start_time, :end_time

  def initialize(event, speaker, start_time, end_time, id)
    @event = event
    @speaker = speaker
    @start_time = start_time
    @end_time = end_time
    @id = id
  end
end

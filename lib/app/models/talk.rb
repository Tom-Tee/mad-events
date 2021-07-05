class Talk
  attr_reader :event, :speaker, :start_time, :end_time

  def initialize(hash = {})
    @event = hash[:event]
    @speaker = hash[:speaker]
    @start_time = hash[:start_time]
    @end_time = hash[:end_time]
    @id = hash[:id]
  end
end

class Talk
  attr_reader :event, :speaker, :start_time, :end_time, :name
  attr_writer :id

  def initialize(hash = {})
    @name = hash[:name]
    @event = hash[:event]
    @speaker = hash[:speaker]
    @start_time = hash[:start_time]
    @end_time = hash[:end_time]
    @id = hash[:id]
  end
end

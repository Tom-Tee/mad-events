class View

  def event_created(event)
    puts "You have created an event - #{event}"
  end

  def speaker_created(speaker)
    puts "You have created a speaker - #{speaker}"
  end

  def show_all_events(events)
    puts "-------"
    puts "---- Some of our previous Events ----"
    events.each do |event|
      puts "-- #{event.name}"
    end
  end
end

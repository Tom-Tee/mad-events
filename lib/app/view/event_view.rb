class EventView

  def event_created(event)
    puts "------------------------------------"
    puts "You have created an event - #{event}"
    puts "------------------------------------"
  end

  def show_all_events(events)
    puts "-------"
    puts "---- Some of our previous Events ----"
    events.each do |event|
    puts "------------------------------------"
      puts "-- #{event.name}"
    end
  end

  def event_not_found
    # system 'clear'
    puts "The event that you requested was not found"
  end
end

class View

  def event_created(event)
    puts "------------------------------------"
    puts "You have created an event - #{event}"
    puts "------------------------------------"
  end

  def speaker_created(speaker)
    puts "------------------------------------"
    puts "You have created a speaker - #{speaker}"
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

  def show_all_speakers(speakers)
    puts "-------"
    puts "---- Some of our our speakers ----"
    speakers.each do |speaker|
    puts "------------------------------------"
      puts "-- #{speaker.name}"
    end
  end
end

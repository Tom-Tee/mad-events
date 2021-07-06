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

  def talk_created(talk, event, start_time, end_time, speaker)
    puts "------------------------------------"
    puts "You have created a talk - #{talk}, at #{event}, start time: #{start_time} end time: #{end_time}. Presented by #{speaker}"
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

  def show_all_talks(talk, start_time, end_time, speaker)
    puts "------------------------------------"
    # puts "- #{talk}, at #{event}, start time: #{start_time} end time: #{end_time}"
    puts "#{start_time} - #{end_time}"
    puts "#{talk} presented by #{speaker}"
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

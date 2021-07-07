class TalkView
  def talk_created(talk, event, start_time, end_time, speaker)
    puts "------------------------------------"
    puts "You have created a talk - #{talk}, at #{event}, start time: #{start_time} end time: #{end_time}. Presented by #{speaker}"
    puts "------------------------------------"
  end

  def show_all_talks(talk, start_time, end_time, speaker)
    puts "------------------------------------"
    puts "#{start_time} - #{end_time}"
    puts "#{talk} presented by #{speaker}"
  end

  def already_a_talk
    puts "there is already a talk at that time, please choose another"
  end

  def speaker_not_found
    puts "The speaker that you requested was not found"
  end

  def event_not_found
    puts "The event that you requested was not found or there is no talks attached"
  end
end

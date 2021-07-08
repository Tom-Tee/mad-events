class TalkView
  def talk_created(talk, event, start_time, end_time, speaker)
    start = "#{start_time[0..1]}:#{start_time[2..5]}"
    end_t = "#{end_time[0..1]}:#{end_time[2..5]}"
    puts "------------------------------------"
    puts "You have created a talk - #{talk}, at #{event}, start time: #{start} end time: #{end_t}. Presented by #{speaker}"
    puts "------------------------------------"
  end

  def show_all_talks(talk, start_time, end_time, speaker)
    start = "#{start_time[0..1]}:#{start_time[2..5]}"
    end_t = "#{end_time[0..1]}:#{end_time[2..5]}"
    puts "------------------------------------"
    puts "#{start} - #{end_t}"
    puts "#{talk} presented by #{speaker}"
  end

  def already_a_talk
    puts "there is already a talk at that time, please choose another"
  end

  def speaker_not_found
    puts "The speaker that you requested was not found"
  end

  def event_not_found
    puts "The event that you requested was not found or there are no talks attached"
  end
end

class SpeakerView

  def speaker_created(speaker)
    puts "------------------------------------"
    puts "You have created a speaker - #{speaker}"
    puts "------------------------------------"
  end

  def show_all_speakers(speakers)
    puts "-------"
    puts "---- Some of our our speakers ----"
    speakers.each do |speaker|
    puts "------------------------------------"
    puts "-- #{speaker.name}"
    end
  end

  def speaker_not_found
    puts "The speaker that you requested was not found"
  end
end

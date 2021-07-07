require 'pry'

class Router
  def initialize(event_controller, speaker_controller, talk_controller)
    @event_controller = event_controller
    @speaker_controller = speaker_controller
    @talk_controller = talk_controller
  end

  def run
    @running = true
    while @running == true
    start_mad_events
    end
  end

  def start_mad_events
    welcome_selection
    get_choice = gets.chomp
    user_action(get_choice)
  end

  def create_event_information
    system 'clear'
    running_event = true
    event_details
    while running_event == true
      choice = gets.chomp
      case
      when choice.include?("CREATE EVENT") then @event_controller.add_event(choice[13..choice.length])
      when choice.include?("CREATE SPEAKER") then @speaker_controller.add_speaker(choice[15..choice.length])
      when choice.include?("CREATE TALK") then talk_validation(choice)
      when choice.include?("PRINT TALKS") then @talk_controller.print_talks(choice[12..choice.length])
      when choice == "4"  then running_event = false
      else
        puts "Try again...Make sure your entry is exactly as requested or 4 to exit"
    end
    end
  end

  def talk_validation(choice)
    choice_edit = choice[12..choice.length]
    regex = /([a-zA-Z_\s()]*) (['a-zA-Z\s']*) ([\d{2}:am||pm]*) ([\d{2}:am||pm]*) ([a-zA-Z]*)/
    match_regex = choice_edit.match(regex)
    if match_regex == nil
      must_be_correct
    else
      @talk_controller.add_talk(match_regex)
    end
  end

  def user_action(choice)
    system 'clear'
    case choice.to_i
    when 1 then @event_controller.list_all_events
    when 2 then @speaker_controller.list_all_speakers
    when 3 then create_event_information
    when 4 then stop!
    else puts "Try again..."
    end
  end

   def welcome_selection
    puts "-------------------------------------------"
    puts "------------- MAD EVENTS ------------------"
    puts "-- VIRTUAL & HYBRID EVENT CONTROL CENTER --"
    puts "-------------------------------------------"
    puts "1. See some of our previous events"
    puts "2. See a list of our speakers"
    puts "3. Create an Event, Speakers and Talks"
    puts "4. Log out"
    print "> "
  end

  def event_details
    puts "-------------------------------------------"
    puts "PLEASE CREATE AN EVENT WITH `CREATE EVENT event_name`"
    puts "EXAMPLE: `CREATE EVENT melbourne_tech_meetup"
    puts "-------------------------------------------"
    puts "PLEASE CREATE A SPEAKER WITH `CREATE SPEAKER speaker_name`"
    puts "EXAMPLE: `CREATE SPEAKER John"
    puts "-------------------------------------------"
    puts "PLEASE CREATE A TALK WITH `CREATE TALK (event_name, talk_name, start_time, end_time, speaker_name)`"
    puts "EXAMPLE `CREATE TALK melbourne_tech_meetup 'working with arrays' 7:30am 8:00am John`"
    puts "-------------------------------------------"
    puts "PLEASE SEE ALL TALKS WITH `PRINT TALKS event_name`"
    puts "Input your choice:"
    puts "EXAMPLE `PRINT TALKS melbourne_tech_meetup`"
    puts "-------------------------------------------"
    puts "PRESS 4 to GO BACK TO VIRTUAL & HYBRID EVENT CONTROL CENTER"
    puts "Input your choice:"
  end

  def must_be_correct
    puts "-------------------------------------------"
    puts "Please write function in the correct manner e.g - `event_name 'hello world' 2:00pm 2:30pm Sam`"
    puts "Make sure that the speaker and event are already created."
    puts "-------------------------------------------"
  end

  def stop!
    @running = false
  end
end

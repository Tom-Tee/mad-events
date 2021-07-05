require 'pry'

class Router

  def initialize(controller)
    @controller = controller
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
    puts "----------------------"
  end

   def welcome_selection
    puts "--------------------"
    puts "---- MAD EVENTS ----"
    puts "--------------------"
    puts "1. See some of our previous events"
    puts "2. See a list of our speakers"
    puts "3. Create your Event, Speakers and Talks"
    puts "4. Exit"
    print "> "
  end

  def event_details
    puts "PLEASE CREATE AN EVENT WITH `CREATE EVENT (event name)`"
    puts "PLEASE CREATE A SPEAKER WITH `CREATE SPEAKER (speaker name)`"
    puts "PLEASE CREATE A TALK WITH `CREATE TALK (name, speaker, start time, end time)`"
    puts "Input your choice;"
  end


  def create_event_information
    event_details
    choice = gets.chomp
    @controller.add_event(choice[13..choice.length]) if (choice.include?("CREATE EVENT"))
    @controller.add_speaker(choice[15..choice.length]) if (choice.include?("CREATE SPEAKER"))
  end

  def user_action(choice)
    case choice.to_i
    when 1 then @controller.list_all_events
    when 2 then @controller.list_all_speakers
    when 3 then create_event_information
    when 4 then stop!
    else puts "Try again..."
    end
  end


  def stop!
    @running = false
  end
end

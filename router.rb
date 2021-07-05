class Router

  def initialize(controller)
    @controller = controller
  end

  def run
    start_mad_events
  end

  def start_mad_events
    welcome_selection
    get_choice = gets.chomp
    user_action(user_choice)
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

  def welcome_message
    puts "PLEASE CREATE AN EVENT WITH `CREATE EVENT (event name)`"
    puts "PLEASE CREATE A SPEAKER WITH `CREATE SPEAKER (speaker name)`"
    puts "PLEASE CREATE A TALK WITH `CREATE TALK (name, speaker, start time, end time)`"
    puts "Input your choice;"
  end

  def user_action(choice)
    case choice
    when choice.include?("CREATE EVENT") then @controller.add_event(choice[12..string.length])
    # when choice.include?("CREATE SPEAKER") then
    # when choice.include?("CREATE TALK") then
    when 0 then stop!
    else puts "Try again..."
    end
  end

end

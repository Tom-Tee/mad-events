require_relative "app/repositories/event_repository"
require_relative "app/controller/event_controller"
require_relative "app/controller/speaker_controller"
require_relative "app/controller/talk_controller"
require_relative "app/repositories/speaker_repository"
require_relative "app/repositories/talk_repository"
require_relative "router"
require 'csv'

EVENT_CSV_FILE = File.join("lib/data/event_data.csv")
SPEAKER_CSV_FILE = File.join("lib/data/speaker_data.csv")
TALK_CSV_FILE = File.join("lib/data/talk_data.csv")

event_repository = EventRepository.new(EVENT_CSV_FILE)
speaker_repository = SpeakerRepository.new(SPEAKER_CSV_FILE)
talk_repository = TalkRepository.new(TALK_CSV_FILE, event_repository, speaker_repository)

event_controller = EventController.new(event_repository)
speaker_controller = SpeakerController.new(speaker_repository)
talk_controller = TalkController.new(talk_repository, speaker_repository, event_repository)
router = Router.new(event_controller, speaker_controller, talk_controller)

router.run

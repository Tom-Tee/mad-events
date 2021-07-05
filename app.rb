require_relative "lib/app/repositories/event_repository"
require_relative "lib/app/controller/controller"
require_relative "lib/app/repositories/speaker_repository"
require_relative "lib/app/repositories/talk_repository"
require_relative "router"
require 'csv'

EVENT_CSV_FILE = File.join("lib/data/event_data.csv")
SPEAKER_CSV_FILE = File.join("lib/data/speaker_data.csv")
TALK_CSV_FILE = File.join("lib/data/talk_data.csv")

event_repository = EventRepository.new(EVENT_CSV_FILE)
speaker_repository = SpeakerRepository.new(SPEAKER_CSV_FILE)
talk_repository = TalkRepository.new(TALK_CSV_FILE, EVENT_CSV_FILE, SPEAKER_CSV_FILE)

controller = Controller.new(talk_repository, event_repository, speaker_repository)
router = Router.new(controller)

router.run

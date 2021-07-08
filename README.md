# Mad Events - Delegate Connect Technical Challenge

![UI - Main Menu](docs/application_start.png)

A CLI application that will let the client create an event, an array of timed talks and a speaker. Each talk belongs to one Event and cannot overlap in time with another. Each talk has one speaker.

The following commands will work on the terminal
- CREATE EVENT event_name
- CREATE SPEAKER speaker_name
- CREATE TALK event_name talk_name talk_start_time talk_end_time speaker_name
- PRINT TALKS event_name => output the talks for an event sorted by the start time

## Setup

Clone the GitHub repository and change directory into `Mad Events`:
```
gh repo clone Tom-Tee/mad-events
```

This application was built with Ruby 2.6.6
You can check your Ruby version with:
```
ruby -v
```

You will also need Bundler installed:
```
bundle install
```
This will install the gems needed to run the program correctly.



## Launching the app

1 - To start the app Mad Events, enter:
```
ruby app.rb
```

(please note at anytime you wish to leave the app just press `4` on each window)

![UI - Main Menu](docs/application_start.png)

2 - On the Main Menu you can see previous events with `1` or previous speakers with `2`

![UI - Previous Events](docs/previous_events.png)

![UI - Previous Speakers](docs/previous_speakers.png)

3 - Press `3` to load up the Creation Menu where a user can create events, speakers and talks.

![UI - Creation Menu](docs/creation_menu.png)

4 - You can create an event with `CREATE EVENT event_name`, please note that the event must be in snake_case if it more than two words. See below:

![UI - Create Event](docs/create_event.png)

5 - You can create a speaker with `CREATE SPEAKER speaker_name`,see below. Please note at the moment that the speaker name must be singular.

![UI - Create Event](docs/create_speaker.png)

6 - You can create a talk with the correct formatting `CREATE TALK event_name 'talk_name' 7:30am 8:00am speaker_name`. Please note that the talk name must have apostrophe around it and the speaker and event must already be created (see below). You can also use 15:00 or 3pm time. Feel free to get one of these wrong when creating the string and have a look what happens!

![UI - Create Talk](docs/create_talk.png)

7 - You can create as many talks, speakers and events as you like. The talks cannot overlap on the same event or you will see an error.

![UI - Time Taken](docs/time_taken.png)

Print off the talks in ascending order for an event with `PRINT TALKS event_name`, see below:

![UI - Print Talks](docs/print_talks.png)


## Testing

I added some testing to the application with rspec, a popular testing framework for Ruby. I tested the models, repositories and controllers for the main features.

You can run the tests in the parent directory with


```
rspec spec
```

## Considerations

1. I did the Mad Events challenge following OoP and TDD principles.

2. My engineering focus of this application was with a classic Ruby MVC design pattern with router & repository included.

3. Although it was not absolutely necessary, I choose to create a CSV database for the application to pull and store data when the app was running. You can see this action by pressing `1` or `2` on the start menu OR run these commands on the model creation menu:
```
PRINT TALKS Hybrid_Melbourne_Showcase
PRINT TALKS Partnering_to_End_Modern_Slavery
```

I also left hints in the repository code that data could be saved to the CSV as well.

## Steps

1. I started by creating the models, repositories and tests for each speaker, event and talk. My basic idea was to use the talk model to store instances of the speaker and event and call from this when validating talks.

2. I then worked on how I was going to integrate the application to take user input/take from the database with a central controller, views and a router. I chose regex & string splitting to do so.

3. I split the controllers up in to seperate parts relating to the models and ran the application a few times and tried squashing any validation bugs.

4. I refined the process and added more tests and data to the database.

## References

[TOD gem Documentation](https://github.com/jackc/tod)

[ARTII gem Documentation](https://github.com/miketierney/artii)

[PRY gem Documentation](https://github.com/pry/pry)

[RSPEC Documentation](https://rspec.info/documentation/3.10/rspec-core/)


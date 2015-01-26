# Pomato

command line pomodoro tool

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pomato'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pomato

## Usage

This is a command line timer.

To begin with, you need to configure an audio track that will be played when a timed job completes:

    echo '~/Dropbox/reminder.mp3' | bin/pomato configure

Now start the pomoto background process  (which periodically checks when timers end and plays the audio track)

    pomato_daemon start

Now schedule your pomato:

    pomato start

This will have scheduled a 25 minute job called 'pomato'. Take a look at what's scheduled:

    pomato

Schedule a 5 minute rest afterwards:

    pomato add resting --for 5

This will have added a 5 minute job called 'resting' after the first pomato.

Schedule a pomato with a specific name:

    pomato preparing thesis

## Other commands

Look at the history (not a very user friendly format at this stage):

    pomato history

To clear all timers:

    pomato stop

To stop the pomato daemon:

    pomato_daemon stop

To see the pomato daemon status:

    pomato_daemon status

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pomato/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

require 'pomato/tick'

module Pomato
  class Configure
    include Paths

    def execute(*args)
      puts 'which track would you like to play when the timer ends?'
      self.config = { track: $stdin.gets.chomp }
    end
  end
end

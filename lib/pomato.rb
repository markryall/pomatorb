require 'pomato/tick'

module Pomato
  module Cli
    def self.execute(*args)
      method, *args = args
      send method, *args
    end

    def self.tick(*args)
      Pomato::Tick.new(*args).execute
    end
  end
end

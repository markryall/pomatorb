require 'pomato/tick'

module Pomato
  class Run
    include Paths

    def execute(*args)
      loop do
        Pomato::Tick.new.execute
        sleep 10
      end
    end
  end
end

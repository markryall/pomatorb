require 'pomato/tick'
require 'pomato/start'
require 'pomato/report'

module Pomato
  module Cli
    def self.execute(*args)
      method, *args = args
      send (method || :report), *args
    end

    def self.report
      Pomato::Report.new.execute
    end

    def self.tick(*args)
      Pomato::Tick.new(*args).execute
    end

    def self.start(*args)
      Pomato::Start.new(*args).execute
    end
  end
end

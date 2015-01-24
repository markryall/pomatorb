require 'pomato/paths'

module Pomato
  class Tick
    include Paths

    def execute
      alert = false
      jobs.each do |job|
        if (job[:start] + job[:time]) < now
          finish_job job
          alert = true
        end
      end
      play_alert if alert
    end
  end
end

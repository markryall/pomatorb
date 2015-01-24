require 'pomato/paths'

module Pomato
  class Tick
    include Paths

    def execute
      jobs = []
      alert = false
      current_jobs.each do |job|
        if (job[:start] + job[:time]) < now
          alert = true
          history "finish #{job[:time]} #{job[:name]}"
        else
          jobs << job
        end
      end
      self.state = { jobs: jobs }
      play_alert if alert
    end
  end
end

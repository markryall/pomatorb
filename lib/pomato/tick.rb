require 'pomato/paths'

module Pomato
  class Tick
    include Paths

    def execute
      now = Time.now.to_i
      jobs = []
      current_jobs.each do |job|
        if job[:time] < now
          history "finish #{job[:time]} #{job[:name]}"
        end
      end
      self.state = { jobs: jobs }
    end
  end
end

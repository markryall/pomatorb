require 'pomato/paths'

module Pomato
  class Start
    include Paths

    def execute
      jobs = current_jobs
      time = args.shift.to_i
      name = args.join(' ')
      history "start #{time} #{name}"
      jobs.push start: now, name: name, time: time
      self.state = { jobs: jobs }
    end
  end
end

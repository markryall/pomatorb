require 'pomato/paths'

module Pomato
  class Start
    include Paths

    def execute
      jobs = current_jobs
      history ['start', *args].join(' ')
      time = Time.now.to_i + args.shift.to_i
      name = args.join(' ')
      current_jobs.push name: name, time: time
      self.state = { jobs: jobs }
    end
  end
end

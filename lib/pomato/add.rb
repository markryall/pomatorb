require 'pomato/paths'
require 'pomato/options'

module Pomato
  class Add
    include Paths
    include Options

    def execute
      start = now
      jobs.each do |job|
        job_end = job[:start] + job[:time]
        start = job_end if job_end > start
      end
      time = (opts[:for] || 25).to_i * 60
      name = opts.arguments.empty? ? 'pomato' : opts.arguments.join(' ')
      add_job start: start, name: name, time: time
    end

    def options
      Slop::Options.new.tap do |opts|
        opts.banner = 'usage: add [options] ...'
        opts.string '--for', 'duration (eg. 10)'
      end
    end
  end
end

require 'pomato/paths'

module Pomato
  class Report
    include Paths

    def execute
      jobs.each do |job|
        duration = now - job[:start]
        remaining = job[:time] - duration
        puts "job #{job[:name]}: #{duration} (#{remaining} remaining)"
      end
    end
  end
end

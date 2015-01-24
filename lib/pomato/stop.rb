require 'pomato/paths'

module Pomato
  class Stop
    include Paths

    def execute
      search_string = args.first
      jobs.each do |job|
        if job[:name].include? search_string
          puts "stopping \"#{job[:name]}\""
          stop_job job
        end
      end
    end
  end
end

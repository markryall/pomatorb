require 'pomato/paths'

module Pomato
  class Report
    include Paths

    def execute
      jobs.sort_by! {|j| now + j[:time]}.each do |job|
        elapsed = now - job[:start]
        remaining = job[:time] - elapsed
        end_time = now + job[:time]
        puts " #{time_format end_time} (#{min_sec elapsed} completed, #{min_sec remaining} of #{min_sec job[:time]} remaining): #{job[:name]}"
      end
    end

    def time_format(seconds)
      time = Time.at seconds
      time.strftime '%I:%M%p'
    end

    def min_sec(seconds)
      "%02d:%02d" % [seconds/60, seconds%60]
    end
  end
end

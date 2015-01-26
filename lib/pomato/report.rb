require 'pomato/paths'

module Pomato
  class Report
    include Paths

    def execute
      jobs.sort_by! {|job| job[:start] + job[:time]}.each do |job|
        end_time = job[:start] + job[:time]
        if now > job[:start]
          elapsed = now - job[:start]
          remaining = job[:time] - elapsed
          puts " #{time_format end_time} (#{min_sec elapsed} completed, #{min_sec remaining} of #{min_sec job[:time]} remaining): #{job[:name]}"
        else
          starting = job[:start] - now
          puts " #{time_format end_time} (#{min_sec job[:time]} starting in #{min_sec starting}): #{job[:name]}"
        end
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

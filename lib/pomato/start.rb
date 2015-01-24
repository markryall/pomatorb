require 'pomato/paths'

module Pomato
  class Start
    include Paths

    def execute
      time = args.shift.to_i * 60
      name = args.join(' ')
      history "start #{time} #{name}"
      make_job start: now, name: name, time: time
    end
  end
end

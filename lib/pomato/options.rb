require 'slop'

module Pomato
  module Options
    attr :opts

    def usage
      puts options
      exit 0
    end

    def opts
      begin
        @opts ||= Slop::Parser.new(options).parse ARGV
      rescue Slop::UnknownOption
        usage
      end
    end
  end
end

require 'pomato/version'

module Pomato
  module Cli
    def self.execute(*args)
      method, *args = args
      send method, *args
    end

    def self.tick(*args)
      puts ['tick', *args].join(' ')
    end
  end
end

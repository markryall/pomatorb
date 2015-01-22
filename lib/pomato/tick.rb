require 'fileutils'
require 'yaml'

module Pomato
  class Tick
    include FileUtils

    attr_reader :args

    def initialize(*args)
      @args = args
    end

    def execute
      state[:time] = Time.now.to_i
      persist
    end

    private

    def persist
      File.open(path, 'w') { |f| YAML.dump(state, f) }
    end

    def state
      return @state if @state
      @state = {}
      @state = YAML.load_file(path) if File.exist?(path)
      @state
    end

    def path
      @path ||= File.join home, 'state'
    end

    def home
      return @home if @home
      @home = File.expand_path('~') + '/.pomato'
      @home.tap {|path| mkdir_p path }
    end
  end
end

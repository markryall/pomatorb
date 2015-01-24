require 'fileutils'
require 'yaml'

module Pomato
  module Paths
    include FileUtils

    attr_reader :args

    def initialize(*args)
      @args = args
    end

    def now
      @now ||= Time.now.to_i
    end

    def play_alert
      `afplay #{path_to('alert.mp3')}`
    end

    def current_jobs
      state[:jobs] || []
    end

    def state=(state)
      dump_yaml state_path, state
    end

    def state
      load_yaml state_path
    end

    def history(message)
      append_to history_path, "#{now} #{message}"
    end

    def state_path
      File.join home, 'state'
    end

    def history_path
      File.join home, 'history'
    end

    def path_to(name)
      File.expand_path(File.join(home, name))
    end

    def home
      (File.expand_path('~') + '/.pomato').tap {|path| mkdir_p path }
    end

    def append_to(path, content)
      File.open(path, 'a') { |f| f.puts content }
    end

    def dump_yaml(path, data)
      File.open(path, 'w') { |f| YAML.dump(data, f) }
    end

    def load_yaml(path)
      File.exist?(path) ? YAML.load_file(path) : {}
    end
  end
end

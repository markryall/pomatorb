require 'securerandom'
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

    def history(message)
      append_to history_path, "#{now} #{message}"
    end

    def history_items
      File.exist?(history_path) ? File.readlines(history_path) : []
    end

    def history_path
      File.join home, 'history'
    end

    def path_to(name)
      File.expand_path(File.join(home, name))
    end

    def jobs
      Dir["#{home('jobs')}/*"].map {|p| load_yaml(p) }
    end

    def dump_job(job)
      dump_yaml(File.join(home('jobs'), job[:id]), job)
    end

    def start_job(job)
      job[:id] = SecureRandom.uuid
      history "#{job[:id]} start #{job[:time]} #{job[:name]}"
      dump_job job.merge(start: now)
    end

    def stop_job(job)
      history "#{job[:id]} stop #{job[:time]} #{job[:name]}"
      destroy_job job
    end

    def finish_job(job)
      history "#{job[:id]} finish #{job[:time]} #{job[:name]}"
      destroy_job job
    end

    def destroy_job(job)
      File.delete File.join(home('jobs'), job[:id])
    end

    def home(*paths)
      (File.join(File.expand_path('~'),'/.pomato',*paths)).tap {|path| mkdir_p path }
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

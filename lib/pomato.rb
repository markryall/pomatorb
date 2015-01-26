module Pomato
  module Cli
    def self.execute(*args)
      method = ARGV.shift
      method ||= :report
      page_class(method).new.execute
    end

    def self.classify(string)
      string.to_s.split('_').map(&:capitalize).join
    end

    def self.page_class(name)
      require "pomato/#{name}"
      Pomato.const_get classify name
    end
  end
end

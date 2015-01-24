require 'pomato/paths'

module Pomato
  class History
    include Paths

    def execute
      history_items.each do |item|
        puts item
      end
    end
  end
end

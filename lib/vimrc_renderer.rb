module VimrcRenderer
  class VimrcRenderer
    def initialize(options)
      @options = options.reject { |_, value| value.nil? }
    end

    def render
      [compatible, leader].join("\n")
    end

    def compatible
      if options.has_key?(:compatible)
        if options[:compatible]
          "set compatible"
        else
          "set nocompatible"
        end
      end
    end

    def leader
      if options.has_key?(:leader)
        "let mapleader=\"#{options[:leader]}\""
      end
    end

    private

    attr_reader :options
  end
end

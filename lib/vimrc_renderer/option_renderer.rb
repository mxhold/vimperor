require_relative 'option_renderer/compatible'
require_relative 'option_renderer/leader'
module VimrcRenderer
  module OptionRenderer
    #:nodoc:
    def self.for(option)
      const_get(option.to_s.split('_').map(&:capitalize).join)
    end
  end
end

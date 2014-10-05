Dir[File.join(__dir__, "option_renderer", "*.rb")].each do |file|
  require file
end
module VimrcRenderer
  module OptionRenderer
    #:nodoc:
    def self.for(option)
      const_get(option.to_s.split('_').map(&:capitalize).join)
    end
  end
end

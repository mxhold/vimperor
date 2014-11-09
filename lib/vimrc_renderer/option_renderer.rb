require_relative '../../app/models/option_config'
require_relative '../options'
Dir[File.join(__dir__, 'option_renderer', '*.rb')].each do |file|
  require file
end
module VimrcRenderer
  module OptionRenderer
    def self.render(option, value)
      if OptionConfig.normal_options.include?(option)
        Options.find(option).render(value)
      else
        renderer_for(option).new(value).render
      end
    end

    def self.renderer_for(option)
      const_get(option.to_s.split('_').map(&:capitalize).join)
    end
  end
end

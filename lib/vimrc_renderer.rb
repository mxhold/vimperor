require 'vimrc_renderer/option_renderer'
module VimrcRenderer
  class VimrcRenderer
    def initialize(options)
      @options = options.reject { |_, value| value.nil? }
    end

    def render
      options.map do |option, value|
        OptionRenderer.render(option, value)
      end.join("\n")
    end

    private

    attr_reader :options
  end
end


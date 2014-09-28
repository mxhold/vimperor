require 'vimrc_renderer/option_renderer'
module VimrcRenderer
  class VimrcRenderer
    def initialize(options)
      @options = options.reject { |_, value| value.nil? }
    end

    def render
      @options.map do |option, value|
        renderer_for(option).new(value).render
      end.join("\n")
    end

    private

    def renderer_for(option)
      {
        compatible: OptionRenderer::Compatible,
        leader: OptionRenderer::Leader
      }[option]
    end

    attr_reader :options
  end
end


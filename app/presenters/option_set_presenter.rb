class OptionSetPresenter
  delegate :render, to: :renderer

  def initialize(option_set)
    renderer_options = coerce_options(option_set.options).deep_symbolize_keys
    @renderer = VimrcRenderer::VimrcRenderer.new(renderer_options)
  end

  private

  attr_reader :renderer

  def coerce_options(options)
    TypeCoersion::HashCoercer.new(config: option_types).coerce(options)
  end

  def option_types
    OptionConfig.option_types
  end
end

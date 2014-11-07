require_relative '../../app/forms/option_set_form'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/module/delegation'

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

  # rubocop:disable Metrics/MethodLength
  def option_types
    OptionConfig.option_types
  end
  # rubocop:enable Metrics/MethodLength
end

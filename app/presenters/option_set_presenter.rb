require_relative '../../lib/type_coersion'
require_relative '../../lib/vimrc_renderer'
require 'active_support/core_ext/hash/keys'

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
    {
      compatible: :boolean,
      leader: :string,
      backspace: {
        indent: :boolean,
        eol: :boolean,
        start: :boolean,
      },
      expandtab: :boolean,
      tab_width: :integer,
      list: {
        list: :boolean,
        trail: :string,
        tab: :string,
        eol: :string,
        nbsp: :string,
        extends: :string,
        precedes: :string,
      }
    }
  end
  # rubocop:enable Metrics/MethodLength
end

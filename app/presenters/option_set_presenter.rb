require_relative '../../lib/vimrc_renderer'
require 'active_support/core_ext/hash/keys'

module HashConversions
  refine Array do
    def deep_to_h
      map do |key, value|
        if value && value.respond_to?(:to_h) && value.to_h != value
          [key, value.deep_to_h]
        else
          [key, value]
        end
      end.to_h
    end
  end
end

class OptionSetPresenter
  using HashConversions

  def initialize(option_set)
    @options = option_set.options
    @renderer = VimrcRenderer::VimrcRenderer.new(renderer_options)
  end

  def render
    @renderer.render
  end

  private

  def renderer_options
    coerce_options(@options)
  end

  def coerce_options(options, option_group: nil)
    options.map do |option, value|
      if value.respond_to?(:fetch)
        [option, coerce_options(value, option_group: option)]
      else
        [option, coerce_to_type(value, type_for(option_group, option))]
      end
    end.deep_to_h.deep_symbolize_keys
  end

  def type_for(*options)
    options.compact.reduce(option_types) do |memo, option|
      memo[option.to_sym]
    end
  end

  def coerce_to_type(value, type)
    case type
    when :boolean
      value == 'true' || value == '1'
    when :string
      value if value && !value.empty?
    when :integer
      value.to_i
    end
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

  def to_boolean(string)
    string = string.to_s
    string == 'true' || string == '1'
  end

  # cf. Object#presence from ActiveSupport
  def nil_if_blank(object)
    blank = object.respond_to?(:empty?) ? object.empty? : !object
    blank ? nil : object
  end
end

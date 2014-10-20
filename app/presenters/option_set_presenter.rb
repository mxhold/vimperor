require_relative '../../lib/vimrc_renderer'
class OptionSetPresenter
  def initialize(option_set)
    @options = option_set.options
    @renderer = VimrcRenderer::VimrcRenderer.new(
      renderer_options
    )
  end

  def render
    @renderer.render
  end

  private

  def renderer_options
    deep_convert_to_hash convert(@options)
  end

  def deep_convert_to_hash(array)
    array.map do |key, value|
      if value && value.respond_to?(:to_h) && value.to_h != value
        [key.to_sym, deep_convert_to_hash(value)]
      else
        [key.to_sym, value]
      end
    end.to_h
  end

  def convert(options, option_group: nil)
    options.map do |option, value|
      if value.respond_to?(:fetch)
        [option, convert(value, option_group: option)]
      else
        if option_group
          [option, coerce_to_type(value, option_types[option_group.to_sym][option.to_sym])]
        else
          [option, coerce_to_type(value, option_types[option.to_sym])]
        end
      end
    end
  end

  def coerce_to_type(value, type)
    case type
    when :boolean
      value == 'true' || value == '1'
    when :string
      value unless value.empty?
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

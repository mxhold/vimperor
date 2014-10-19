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

  def option(*keys)
    keys.reduce(@options) do |memo, key|
      memo.fetch(key.to_s, nil) if memo.respond_to?(:fetch)
    end
  end

  # rubocop:disable Metrics/MethodLength
  def renderer_options
    {
      compatible: to_boolean(option(:compatible)),
      leader: option(:leader),
      backspace: {
        indent: to_boolean(option(:backspace, :indent)),
        eol: to_boolean(option(:backspace, :eol)),
        start: to_boolean(option(:backspace, :start))
      },
      expandtab: to_boolean(option(:expandtab)),
      tab_width: option(:tab_width),
      list: {
        list: to_boolean(option(:list, :list)),
        trail: nil_if_blank(option(:list, :trail)),
        tab: nil_if_blank(option(:list, :tab)),
        eol: nil_if_blank(option(:list, :eol)),
        nbsp: nil_if_blank(option(:list, :nbsp)),
        extends: nil_if_blank(option(:list, :extends)),
        precedes: nil_if_blank(option(:list, :precedes)),
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

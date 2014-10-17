require_relative '../../lib/vimrc_renderer'
class OptionSetPresenter
  def initialize(option_set)
    @renderer = VimrcRenderer::VimrcRenderer.new(
      renderer_options_for(option_set)
    )
  end

  def render
    @renderer.render
  end

  private

  # rubocop:disable Metrics/MethodLength
  def renderer_options_for(option_set)
    {
      compatible: to_boolean(option_set.compatible),
      leader: option_set.leader,
      backspace: {
        indent: to_boolean(option_set.backspace_indent),
        eol: to_boolean(option_set.backspace_eol),
        start: to_boolean(option_set.backspace_start)
      },
      expandtab: to_boolean(option_set.expandtab),
      tab_width: option_set.tab_width,
      list: {
        list: to_boolean(option_set.list),
        trail: nil_if_blank(option_set.listchars_trail),
        tab: nil_if_blank(
          "#{option_set.listchars_tab_first}#{option_set.listchars_tab_rest}"
        ),
        tab_first: nil_if_blank(option_set.listchars_tab_first),
        tab_rest: nil_if_blank(option_set.listchars_tab_rest),
        eol: nil_if_blank(option_set.listchars_eol),
        nbsp: nil_if_blank(option_set.listchars_nbsp),
        extends: nil_if_blank(option_set.listchars_extends),
        precedes: nil_if_blank(option_set.listchars_precedes),
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

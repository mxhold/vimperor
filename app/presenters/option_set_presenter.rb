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
      tab_width: option_set.tab_width
    }
  end

  def to_boolean(string)
    string = string.to_s
    string == 'true' || string == '1'
  end
end

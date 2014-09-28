require_relative '../../lib/vimrc_renderer'
class OptionSetPresenter
  def initialize(option_set)
    @renderer = VimrcRenderer::VimrcRenderer.new(
      compatible: option_set.compatible?,
      leader: option_set.leader
    )
  end

  def render
    @renderer.render
  end
end

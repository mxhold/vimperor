require 'spec_helper'
require_relative '../../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer::TabWidth do
  describe '#render' do
    subject { described_class.new(2) }
    it 'returns the value as tabstop and shiftwidth' do
      expect(subject.render).to eql <<-eos
set tabstop=2
set shiftwidth=2
set shiftround
eos
    end
  end
end

require 'spec_helper'
require_relative '../../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer::Leader do
  describe '#render' do
    subject { described_class.new(',') }
    it 'returns the value prefixed with let mapleader' do
      expect(subject.render).to eql "let mapleader=\",\""
    end
  end
end

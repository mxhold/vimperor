require 'spec_helper'
require_relative '../../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer::Expandtab do
  describe '#render' do
    context 'initialized with true' do
      subject { described_class.new(true) }
      it 'returns set expandtab' do
        expect(subject.render).to eql 'set expandtab'
      end
    end
    context 'initialized with false' do
      subject { described_class.new(false) }
      it 'returns set noexpandtab' do
        expect(subject.render).to eql 'set noexpandtab'
      end
    end
  end
end

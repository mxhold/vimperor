require 'spec_helper'
require_relative '../../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer::Compatible do
  describe '#render' do
    context 'initialized with true' do
      subject { described_class.new(true) }
      it 'returns set compatible' do
        expect(subject.render).to eql 'set compatible'
      end
    end
    context 'initialized with false' do
      subject { described_class.new(false) }
      it 'returns set nocompatible' do
        expect(subject.render).to eql 'set nocompatible'
      end
    end
  end
end


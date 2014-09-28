require 'spec_helper'
require_relative '../../../lib/vimrc_renderer'

describe VimrcRenderer::VimrcRenderer do
  describe '#render' do
    context 'all options set' do
      subject do
        described_class.new(
          compatible: true,
          leader: ','
        )
      end
      it 'renders all the options with newlines between' do
        expect(subject.render).to eql("set compatible\nlet mapleader=\",\"")
      end
    end
    context 'some options set' do
      subject do
        described_class.new(
          leader: ','
        )
      end
      it 'renders only the provided options with newlines between' do
        expect(subject.render).to eql("let mapleader=\",\"")
      end
    end
    context 'some options nil' do
      subject do
        described_class.new(
          compatible: nil,
          leader: ','
        )
      end
      it 'renders only the non-nil options with newlines between' do
        expect(subject.render).to eql("let mapleader=\",\"")
      end
    end
  end
end

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

describe VimrcRenderer::OptionRenderer::Leader do
  describe '#render' do
    subject { described_class.new(',') }
    it 'returns the value prefixed with let mapleader' do
      expect(subject.render).to eql "let mapleader=\",\""
    end
  end
end

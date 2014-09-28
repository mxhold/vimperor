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


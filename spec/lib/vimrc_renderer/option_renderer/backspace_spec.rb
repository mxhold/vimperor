require 'spec_helper'
require_relative '../../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer::Backspace do
  describe '#render' do
    context 'indent, eol, and start set' do
      subject { described_class.new(indent: true, eol: true, start: true) }
      it 'returns all of the options' do
        expect(subject.render).to eql 'set backspace=indent,eol,start'
      end
    end
    context 'all options set to false' do
      subject { described_class.new(indent: false, eol: false, start: false) }
      it 'returns none of the options' do
        expect(subject.render).to eql 'set backspace='
      end
    end
    context 'some options set' do
      subject { described_class.new(indent: true, eol: false, start: true) }
      it 'returns the true options' do
        expect(subject.render).to eql 'set backspace=indent,start'
      end
    end
  end
end

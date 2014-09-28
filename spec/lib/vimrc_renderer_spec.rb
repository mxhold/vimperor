require 'spec_helper'
require_relative '../../lib/vimrc_renderer'

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
  end

  describe 'options' do
    context 'option not specified' do
      subject { described_class.new(compatible: nil) }
      it 'returns nil' do
        expect(subject.compatible).to be_nil
        expect(subject.leader).to be_nil
      end
    end
    describe '#compatible' do
      context 'compatible set to true' do
        subject { described_class.new(compatible: true) }
        it 'returns set compatible' do
          expect(subject.compatible).to eql "set compatible"
        end
      end
      context 'compatible set to false' do
        subject { described_class.new(compatible: false) }
        it 'returns set nocompatible' do
          expect(subject.compatible).to eql 'set nocompatible'
        end
      end
    end
    describe '#leader' do
      subject { described_class.new(leader: ' ') }
      it 'returns the mapping for the provided leader key' do
        expect(subject.leader).to eql "let mapleader=\" \""
      end
    end
  end
end

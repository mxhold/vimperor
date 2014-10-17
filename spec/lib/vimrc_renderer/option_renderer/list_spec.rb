require 'spec_helper'
require_relative '../../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer::List do
  describe '#render' do
    context 'no list' do
      subject { described_class.new(list: false) }
      it 'returns set nolist' do
        expect(subject.render).to eql 'set nolist'
      end
    end
    context 'list with no listchars' do
      subject { described_class.new(list: true) }
      it 'returns set list without listchars' do
        expect(subject.render).to eql 'set list'
      end
    end
    context 'list with all listchars' do
      subject do
        described_class.new(
          list: true,
          tab: '>-',
          eol: '$',
          trail: '*',
          extends: '>',
          precedes: '<',
          nbsp: '_',
        )
      end
      it 'returns all listchar settings' do
        expect(subject.render).to eql(
          'set list listchars=eol:$,tab:>-,trail:*,extends:>,precedes:<,nbsp:_'
        )
      end
    end
    context 'list with some listchars' do
      subject do
        described_class.new(
          precedes: '<',
          list: true,
          nbsp: '_',
          trail: '*',
        )
      end
      it 'returns the settings in the order described in the documentation' do
        expect(subject.render).to eql(
          'set list listchars=trail:*,precedes:<,nbsp:_'
        )
      end
    end
    context 'tab is not exactly 2 characters' do
      subject do
        described_class.new(
          list: true,
          tab: '%',
          trail: '*',
        )
      end
      it 'ignores the tab setting since it would cause an error' do
        expect(subject.render).to eql 'set list listchars=trail:*'
      end
    end
  end
end

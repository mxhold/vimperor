require 'spec_helper'
require_relative '../../app/presenters/option_set_presenter'

describe OptionSetPresenter do
  describe '#render' do
    subject do
      described_class.new(
        double('OptionSet',
          compatible: 'false',
          leader: ',',
          backspace_indent: '1',
          backspace_eol: '1',
          backspace_start: '1',
          expandtab: 'true',
          tab_width: '2',
          list: 'true',
          listchars_trail: '*',
          listchars_tab_first: '>',
          listchars_tab_rest: '-',
          listchars_eol: '$',
          listchars_nbsp: '',
          listchars_extends: '>',
          listchars_precedes: '<',
        )
      )
    end
    it 'renders all the options' do
      expect(subject.render).to eql(
        <<-EOS.chomp
set nocompatible
let mapleader=\",\"
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set list listchars=eol:$,tab:>-,trail:*,extends:>,precedes:<
        EOS
      )
    end
  end
end

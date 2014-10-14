require 'spec_helper'
require_relative '../../app/presenters/option_set_presenter'

describe OptionSetPresenter do
  describe '#render' do
    subject do
      described_class.new(
        double("OptionSet",
          compatible: 'true',
          leader: ',',
          backspace_indent: '1',
          backspace_eol: '1',
          backspace_start: '1',
          expandtab: 'true',
          tab_width: '2'
        )
      )
    end
    it 'renders all the options' do
      expect(subject.render).to eql(
        <<-eos
set compatible
let mapleader=\",\"
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
        eos
      )
    end
  end
end

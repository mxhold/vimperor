require 'spec_helper'
require_relative '../../app/presenters/option_set_presenter'

describe OptionSetPresenter do
  describe '#render' do
    subject do
      described_class.new(
        double(
          'OptionSet',
          'options' => {
            'compatible' => 'false',
            'leader' => ',',
            'backspace' => {
              'indent' => '1',
              'eol' => '1',
              'start' => '1',
            },
            'expandtab' => 'true',
            'tab_width' => '2',
            'list' =>  {
              'list' => 'true',
              'trail' => '*',
              'tab' => '>-',
              'eol' => '$',
              'nbsp' => '',
              'extends' => '>',
              'precedes' => '<',
            }
          }
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

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
          backspace_start: '1'
        )
      )
    end
    it 'renders all the options' do
      expect(subject.render).to eql("set compatible\nlet mapleader=\",\"")
    end
  end
end

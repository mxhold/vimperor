require 'spec_helper'
require_relative '../../app/presenters/option_set_presenter'

describe OptionSetPresenter do
  describe '#render' do
    subject do
      described_class.new(
        OptionSet.new(compatible: 'true', leader: ',')
      )
    end
    it 'renders all the options' do
      expect(subject.render).to eql("set compatible\nlet mapleader=\",\"")
    end
  end
end

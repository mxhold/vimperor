require 'spec_helper'
require_relative '../../../lib/options'

describe 'compatible option' do
  subject do
    Options.find(:compatible)
  end
  describe '#label' do
    it 'returns Compatible' do
      expect(subject.label).to eql 'Vi compatibility'
    end
  end

  describe '#doc_url' do
    it 'returns a url to documentation' do
      expect(subject.doc_url).to eql "http://vimdoc.sourceforge.net/htmldoc/options.html#'compatible'"
    end
  end

  describe '#help_text' do
    it 'describes what the option does' do
      expect(subject.help_text).to eql 'Adds backwards-compatibility with the Vi editor by turning off many Vim features'
    end
  end

  describe '#form_fields' do
    it 'returns fields for setting the option' do
      form_builder = ActionView::Helpers::FormBuilder.new(:test_model, nil, ActionView::Base.new, {})
      expect(subject.form_fields(form_builder)).to eql '<div class="radio"><label for="test_model_compatible_true"><input id="test_model_compatible_true" name="test_model[compatible]" type="radio" value="true" />On</label><div class="radio"><label for="test_model_compatible_false"><input id="test_model_compatible_false" name="test_model[compatible]" type="radio" value="false" />Off</label></div></div>'
    end
  end
end

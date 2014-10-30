require 'spec_helper'
require_relative '../../../lib/options'

describe Options::Compatible do
  describe '#label' do
    it 'returns Compatible' do
      expect(described_class.label).to eql 'Vi compatibility'
    end
  end

  describe '#doc_url' do
    it 'returns a url to documentation' do
      expect(described_class.doc_url).to eql "http://vimdoc.sourceforge.net/htmldoc/options.html#'compatible'"
    end
  end

  describe '#help_text' do
    it 'describes what the option does' do
      expect(described_class.help_text).to eql 'Adds backwards-compatibility with the Vi editor by turning off many Vim features'
    end
  end

  describe '#form_fields' do
    it 'returns fields for setting the option' do
      form_builder = ActionView::Helpers::FormBuilder.new(:test_model, nil, ActionView::Base.new, {})
      expect(described_class.form_fields(form_builder)).to eql '<div class="radio"><label for="test_model_compatible_true"><input id="test_model_compatible_true" name="test_model[compatible]" type="radio" value="true" />On</label><div class="radio"><label for="test_model_compatible_false"><input checked="checked" id="test_model_compatible_false" name="test_model[compatible]" type="radio" value="false" />Off (recommended)</label></div></div>'
    end
  end
end

require 'spec_helper'
require_relative '../../../../lib/options'

describe Options::Type::String do
  subject { described_class.new(field_name: :foobar) }
  describe '#render' do
    it 'returns set <field_name>=<value>' do
      expect(subject.render('myvalue')).to eql 'set foobar=myvalue'
    end
  end

  describe '#form_fields' do
    subject do
      described_class.new(field_name: :foobar)
    end
    let(:form_builder) do
      ActionView::Helpers::FormBuilder.new(
        :test_model,
        double('test_model', foobar: 'baz'),
        ActionView::Base.new,
        {}
      )
    end
    it 'builds the form fields on the provided form builder for the option' do
      expected_markup = <<-eos.gsub(/\n/, '')
<input
 type="text"
 value="baz"
 name="test_model[foobar]"
 id="test_model_foobar"
 />
      eos
      expect(subject.form_fields(form_builder)).to eql expected_markup
    end
  end
end

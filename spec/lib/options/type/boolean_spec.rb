require 'spec_helper'
require_relative '../../../../lib/options'

describe Options::Type::Boolean do
  subject { described_class.new(field_name: :foobar) }
  describe '#render' do
    context 'truthy value' do
      it 'returns set<field_name>' do
        expect(subject.render(true)).to eql 'set foobar'
      end
    end
    context 'falsey value' do
      it 'returns setno<field_name>' do
        expect(subject.render(false)).to eql 'set nofoobar'
      end
    end
  end

  describe '#form_fields' do
    subject do
      described_class.new(
        field_name: :foobar,
        true_label: 'TRUE',
        false_label: 'FALSE'
      )
    end
    let(:form_builder) do
      ActionView::Helpers::FormBuilder.new(
        :test_model,
        nil,
        ActionView::Base.new,
        {}
      )
    end
    it 'builds the form fields on the provided form builder for the option' do
      expected_markup = <<-eos.gsub(/\n/, '')
<div class="radio">
<label for="test_model_foobar_true">
<input
 type="radio"
 value="true"
 name="test_model[foobar]"
 id="test_model_foobar_true"
 />
TRUE
</label>
<div class="radio">
<label for="test_model_foobar_false">
<input
 type="radio"
 value="false"
 name="test_model[foobar]"
 id="test_model_foobar_false"
 />
FALSE
</label>
</div>
</div>
      eos
      expect(subject.form_fields(form_builder)).to eql expected_markup
    end
  end
end

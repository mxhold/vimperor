require_relative '../../../lib/options'

describe Options::FormHelper do
  let(:form_builder) do
    ActionView::Helpers::FormBuilder.new(
      :test_model,
      double(
        'test_model',
        foobar: true,
        baz: 'buzz'
      ),
      ActionView::Base.new,
      {}
    )
  end
  context 'initialized with a form builder' do
    subject do
      described_class.new(form_builder)
    end

    describe '.concat_fields' do
      it 'yields an object that renders fields' do
        result = described_class.concat_fields(form_builder) do |f|
          f.radio_field(:foobar, value: false, label: 'FALSE')
          f.radio_field(:foobar, value: true, label: 'TRUE')
        end
        expect(result).to eql <<-eos.gsub(/\n/, '')
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
<div class="radio">
<label for="test_model_foobar_true">
<input
 type="radio"
 value="true"
 checked="checked"
 name="test_model[foobar]"
 id="test_model_foobar_true"
 />
TRUE
</label>
</div>
        eos
      end
    end
    describe '#radio_field' do
      context 'given a name, value, and label' do
        it 'renders a radio field with a label' do
          result = subject.radio_field(:foobar, value: true, label: 'TRUE')
          expect(result).to eql <<-eos.gsub(/\n/, '')
<div class="radio">
<label for="test_model_foobar_true">
<input
 type="radio"
 value="true"
 checked="checked"
 name="test_model[foobar]"
 id="test_model_foobar_true"
 />
TRUE
</label>
</div>
          eos
        end
      end
    end
    describe '#text_field' do
      context 'given a name' do
        it 'renders a text field' do
          expect(subject.text_field(:baz)).to eql <<-eos.gsub(/\n/, '')
<input
 class="form-control baz"
 data-action="selectContents"
 type="text"
 value="buzz"
 name="test_model[baz]"
 id="test_model_baz"
 />
          eos
        end
      end
    end
  end
end

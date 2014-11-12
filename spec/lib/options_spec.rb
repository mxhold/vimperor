require 'spec_helper'
require_relative '../../lib/options'

describe Options do
  describe '.find' do
    context 'provided a configured option\'s name' do
      let(:config) do
        {
          'options' => {
            'test_option' => {
              'label' => 'Test Option',
              'doc_url' => 'http://url/to/doc',
              'help_text' => 'Help Text',
              'field_type' => 'boolean'
            }
          }
        }
      end
      before do
        Options.instance_variable_set(:@registry, nil)
        allow(YAML).to receive(:load).and_return(config)
      end
      after do
        Options.instance_variable_set(:@registry, nil)
      end
      it 'returns the option' do
        option = described_class.find(:test_option)
        expect(option.label).to eql 'Test Option'
        expect(option.doc_url).to eql 'http://url/to/doc'
        expect(option.help_text).to eql 'Help Text'
        expect(option.render(true)).to eql 'set test_option'
      end
    end

    context 'provided anything else' do
      it 'raises an error' do
        expect do
          described_class.find(:foo)
        end.to raise_error(ArgumentError)
      end
    end
  end
end

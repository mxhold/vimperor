require 'spec_helper'
require_relative '../../../lib/options'

describe Options::Type do
  describe '.new' do
    context 'provided a valid field_type' do
      let(:foo_class) { double('Foo') }
      let(:expected_instance) { double('Foo instance') }
      it 'returns an instance of a type' do
        stub_const('Options::Type::Foo', foo_class)
        expect(foo_class).to receive(:new).with(
          field_name: 'bar'
        ).and_return(expected_instance)
        instance = described_class.new(field_type: :foo, field_name: 'bar')

        expect(instance).to eql expected_instance
      end
    end
    context 'provided an invalid field type' do
      it 'raises an exception' do
        expect do
          described_class.new(field_type: :foo, field_name: 'bar')
        end.to raise_error(ArgumentError, 'Unknown option type: foo')
      end
    end
  end
end

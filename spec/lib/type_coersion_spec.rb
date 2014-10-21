require 'spec_helper'
require_relative '../../lib/type_coersion'

describe ArrayExtensions::DeepToH do
  describe '#deep_to_h' do
    it 'converts deeply nested array into hash' do
      module TestModule
        using ArrayExtensions::DeepToH
        def self.actual_hash
          [[:a, [[:b, [[:c, :d]]]]]].deep_to_h
        end
      end
      expected_hash = { a: { b: { c: :d } } }
      expect(TestModule.actual_hash).to eql expected_hash
    end
  end
end

describe TypeCoersion do
  describe '.coercer_for' do
    it 'returns a coercer class for the given type' do
      module TypeCoersion
        class FooCoercer
        end
      end
      expect(described_class.coercer_for(:foo)).to eql TypeCoersion::FooCoercer
    end
  end
end

describe TypeCoersion::HashCoercer do
  describe '#coerce' do
    it 'converts the values of a hash based on the provided config' do
      config = {
        bool: :boolean,
        str: :string,
        int: :integer,
        deep: {
          nested: {
            hash: :boolean,
          }
        },
        empty: :string,
      }
      hash = {
        bool: 'true',
        str: 123,
        int: '123',
        deep: {
          nested: {
            hash: 'false',
          }
        },
        empty: '',
      }
      expected_hash = {
        bool: true,
        str: '123',
        int: 123,
        deep: {
          nested: {
            hash: false,
          }
        },
        empty: nil,
      }
      coercer = described_class.new(config: config)
      expect(coercer.coerce(hash)).to eql expected_hash
    end
  end
end

describe TypeCoersion::IntegerCoercer do
  describe '.coerce' do
    context 'non-nil value' do
      it 'converts the value to an integer' do
        expect(described_class.coerce('1')).to eql 1
      end
    end

    context 'nil' do
      it 'returns nil, not zero' do
        expect(described_class.coerce(nil)).to eql nil
      end
    end
  end
end

describe TypeCoersion::StringCoercer do
  describe '.coerce' do
    context 'non-nil string' do
      it 'returns the original string' do
        expect(described_class.coerce('foo')).to eql 'foo'
      end
    end

    context 'integer' do
      it 'returns the integer converted to a string' do
        expect(described_class.coerce(1)).to eql '1'
      end
    end

    context 'empty string' do
      it 'returns nil' do
        expect(described_class.coerce('')).to eql nil
      end
    end

    context 'nil' do
      it 'returns nil' do
        expect(described_class.coerce(nil)).to eql nil
      end
    end
  end
end

describe TypeCoersion::BooleanCoercer do
  describe '.coerce' do
    context 'true string' do
      it 'returns true' do
        expect(described_class.coerce('true')).to eql true
      end
    end

    context '1 string' do
      it 'returns true' do
        expect(described_class.coerce('1')).to eql true
      end
    end

    context '1 integer' do
      it 'returns true' do
        expect(described_class.coerce(1)).to eql true
      end
    end

    context 'true' do
      it 'returns true' do
        expect(described_class.coerce(true)).to eql true
      end
    end

    context 'false string' do
      it 'returns false' do
        expect(described_class.coerce('false')).to eql false
      end
    end

    context '0 string' do
      it 'returns false' do
        expect(described_class.coerce('0')).to eql false
      end
    end

    context '0 integer' do
      it 'returns false' do
        expect(described_class.coerce(0)).to eql false
      end
    end

    context 'false' do
      it 'returns false' do
        expect(described_class.coerce(false)).to eql false
      end
    end

    context 'nil' do
      it 'returns nil' do
        expect(described_class.coerce(nil)).to eql nil
      end
    end
  end
end

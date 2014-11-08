require 'spec_helper'
require_relative '../../../lib/options/registry'

describe Options::Registry do
  let(:item) { double('apple') }
  subject { described_class.new('Fruit') }

  describe '#register' do
    context 'with new item' do
      context 'with symbol name' do
        it 'stores the item by its name in the registry' do
          subject.register(:apple, item)
          expect(subject.registered?(:apple)).to be_truthy
        end
      end
      context 'with string name' do
        it 'stores the item by its name in the registry' do
          subject.register('apple', item)
          expect(subject.registered?(:apple)).to be_truthy
        end
      end
    end
    context 'with item already registered by symbol or string name' do
      it 'raises an ArgumentError' do
        subject.register(:apple, item)
        expect {
          subject.register('apple', item)
        }.to raise_error(ArgumentError, 'Fruit already registered: apple')
      end
    end
  end

  describe '#find' do
    context 'with the name of a registered item' do
      context 'as a symbol' do
        it 'returns the item' do
          subject.register(:apple, item)
          expect(subject.find(:apple)).to eql item
        end
      end
      context 'as a string' do
        it 'returns the item' do
          subject.register(:apple, item)
          expect(subject.find('apple')).to eql item
        end
      end
    end
    context 'with the name of an unregistered item' do
      it 'raises an ArgumentError' do
        expect {
          subject.find(:foo)
        }.to raise_error(ArgumentError, 'Fruit not registered: foo')
      end
    end
  end

  describe '#registered?' do
    context 'with the name of a registered item' do
      context 'as a symbol' do
        it 'returns a truthy value' do
          subject.register(:apple, item)
          expect(subject.registered?(:apple)).to be_truthy
        end
      end
      context 'as a string' do
        it 'returns a truthy value' do
          subject.register(:apple, item)
          expect(subject.registered?('apple')).to be_truthy
        end
      end
    end
    context 'with the name of an unregistered item' do
      it 'returns a falsey value' do
        expect(subject.registered?(:apple)).to be_falsey
      end
    end
  end
end

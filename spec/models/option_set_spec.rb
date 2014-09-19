require 'rails_helper'

describe OptionSet do
  describe 'db columns' do
    it { should have_db_column(:compatible).of_type(:boolean).with_options(null: false) }
  end

  describe 'validations' do
    it { should_not allow_value(nil).for(:compatible) }
  end

  describe '#generate_file' do
    it 'passes its options to the vimrc generator' do
      options = { compatible: true }
      expect(VimrcGenerator).to receive(:generate).with(options)

      described_class.new(options).generate_file
    end
  end
end

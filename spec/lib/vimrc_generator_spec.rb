require 'spec_helper'
require './lib/vimrc_generator'

describe VimrcGenerator do
  describe '.generate' do
    context 'compatible' do
      it 'sets compatible' do
        options = { compatible: true }
        expect(described_class.generate(options)).to eql "set compatible\n"
      end
    end
    context 'nocompatible' do
      it 'sets nocompatible' do
        options = { compatible: false }
        expect(described_class.generate(options)).to eql "set nocompatible\n"
      end
    end
  end
end

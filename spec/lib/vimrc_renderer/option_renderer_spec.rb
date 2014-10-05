require 'spec_helper'
require_relative '../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer do
  describe '.for' do
    it 'returns the renderer class with the provided name' do
      test_class = described_class.const_set('TestClass', Class.new)
      expect(described_class.for('test_class')).to eql test_class
    end
  end
end

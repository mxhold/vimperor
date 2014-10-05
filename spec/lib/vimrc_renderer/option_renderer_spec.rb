require 'spec_helper'
require_relative '../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer do
  describe '.renderer_for' do
    it 'returns the renderer class with the provided name' do
      test_class = described_class.const_set('TestClass', Class.new)
      expect(described_class.renderer_for('test_class')).to eql test_class
    end
  end
end

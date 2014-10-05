require 'spec_helper'
require_relative '../../../lib/vimrc_renderer'

describe VimrcRenderer::OptionRenderer do
  describe '.render' do
    it 'initializes a renderer and calls render on it' do
      renderer_instance = double("renderer_instance")
      renderer_class = double("renderer_class")
      expect(described_class).to receive(:renderer_for).with('option').and_return(renderer_class)
      expect(renderer_class).to receive(:new).with('value').and_return(renderer_instance)
      expect(renderer_instance).to receive(:render)
      described_class.render('option', 'value')
    end
  end
  describe '.renderer_for' do
    it 'returns the renderer class with the provided name' do
      test_class = described_class.const_set('TestClass', Class.new)
      expect(described_class.renderer_for('test_class')).to eql test_class
    end
  end
end

require 'spec_helper'
require_relative '../../app/models/option_config'

describe OptionConfig do
  describe '.option_types' do
    it 'returns a hash with attribute names as keys and types as values' do
      expected_hash = {
        compatible: :boolean,
        leader: :string,
        backspace: {
          indent: :boolean,
          eol: :boolean,
          start: :boolean,
        },
        expandtab: :boolean,
        tab_width: :integer,
        list: {
          list: :boolean,
          trail: :string,
          tab: :string,
          eol: :string,
          nbsp: :string,
          extends: :string,
          precedes: :string,
        }
      }
      expect(described_class.option_types).to eql expected_hash
    end
  end

  describe '.options' do
    it 'returns an array of every option field that appears in the option form' do
      expected_array = [
        :compatible,
        :leader,
        :backspace_indent,
        :backspace_eol,
        :backspace_start,
        :expandtab,
        :tab_width,
        :list,
        :listchars_trail,
        :listchars_tab_first,
        :listchars_tab_rest,
        :listchars_eol,
        :listchars_nbsp,
        :listchars_extends,
        :listchars_precedes
      ]
      expect(described_class.options).to eql expected_array
    end
  end

  let(:flat_attributes_hash) do
    {
      compatible: '1',
      leader: '2',
      backspace_indent: '3',
      backspace_eol: '4',
      backspace_start: '5',
      expandtab: '6',
      tab_width: '7',
      list: '8',
      listchars_trail: '9',
      listchars_tab_first: 'a',
      listchars_tab_rest: 'z',
      listchars_eol: '12',
      listchars_nbsp: '13',
      listchars_extends: '14',
      listchars_precedes: '15',
    }
  end
  let(:attributes_hash) do
    {
      'compatible' => '1',
      'leader' => '2',
      'backspace' => {
        'indent' => '3',
        'eol' => '4',
        'start' => '5',
      },
      'expandtab' => '6',
      'tab_width' => '7',
      'list' => {
        'list' => '8',
        'trail' => '9',
        'tab' => 'az',
        'eol' => '12',
        'nbsp' => '13',
        'extends' => '14',
        'precedes' => '15',
      }
    }
  end
  describe '#attributes' do
    it 'returns a hash of OptionSet attributes delegating to variables from the options array' do
      option_form = double(
        'option_form,',
        flat_attributes_hash
      )
      subject = described_class.new(option_form)
      expect(subject.attributes).to eql attributes_hash
    end
  end

  describe '.form_attributes' do
    it 'returns a flat hash of attributes given a deep hash of options' do
      form_attributes = described_class.form_attributes(attributes_hash)
      expect(form_attributes).to eql flat_attributes_hash
    end
  end
end

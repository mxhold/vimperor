require 'spec_helper'
require_relative '../../app/forms/option_set_form'
require 'shoulda/matchers'

describe OptionSetForm do
  describe 'validations' do
    it { should validate_presence_of(:creator_ip) }
  end

  describe '#submit' do
    let(:test_option_set_class) do
      Class.new do
        def self.create!(_attributes); end
      end
    end

    it 'creates an OptionSet with nested hash attributes' do
      form = described_class.new(
        compatible: 'true',
        leader: ',',
        backspace_indent: '1',
        backspace_eol: '0',
        backspace_start: '0',
        expandtab: 'true',
        tab_width: '2',
        list: 'false',
        listchars_trail: '*',
        listchars_tab_first: '>',
        listchars_tab_rest: '-',
        listchars_eol: '$',
        listchars_nbsp: '=',
        listchars_extends: '>',
        listchars_precedes: '<',
        creator_ip: '192.160.1.1'
      )
      expect(test_option_set_class).to receive(:create!).with(
        options: {
          compatible: 'true',
          leader: ',',
          backspace: {
            indent: '1',
            eol: '0',
            start: '0',
          },
          expandtab: 'true',
          tab_width: '2',
          list: {
            list: 'false',
            trail: '*',
            tab: '>-',
            eol: '$',
            nbsp: '=',
            extends: '>',
            precedes: '<',
          }
        },
        creator_ip: '192.160.1.1'
      )
      form.submit(test_option_set_class)
    end

    context 'missing required attributes' do
      it 'returns self with errors' do
        result = described_class.new.submit(test_option_set_class)
        expect(result.errors).not_to be_empty
      end
    end
  end
end

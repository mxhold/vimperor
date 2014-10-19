require 'rails_helper'

describe OptionSet do
  describe 'db columns' do
    # TODO: Update to jsonb when Postgres 9.4 is released
    it { should have_db_column(:options).of_type(:json) }
  end

  describe '#to_param' do
    it 'returns the id encoded as a hashid' do
      id = 123
      hashid = 'abc123'
      expect(Hashid).to receive(:encode).with(id).and_return(hashid)
      expect(described_class.new(id: id).to_param).to eql hashid
    end
  end
end

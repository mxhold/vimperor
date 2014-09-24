require 'rails_helper'
require_relative '../../app/services/hashid'

describe Hashid do
  describe '.encode' do
    it 'returns an encoded hashid of at least 6 characters of the provided id' do
      id = 123
      hashid = described_class.encode(id)
      expect(hashid).not_to eql id
      expect(hashid.length).to be >= 6
    end
  end

  describe '.decode' do
    it 'returns the decoded id of the provided hashid' do
      id = 123
      hashid = described_class.encode(id)
      expect(described_class.decode(hashid)).to eql id
    end
  end
end

require 'rails_helper'

describe OptionSet do
  describe 'db columns' do
    it { should have_db_column(:options).of_type(:hstore) }
  end

  describe 'validations' do
    it { should validate_presence_of(:options) }
  end
end

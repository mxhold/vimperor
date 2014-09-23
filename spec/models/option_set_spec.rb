require 'rails_helper'

describe OptionSet do
  describe 'db columns' do
    it { should have_db_column(:compatible).of_type(:boolean).with_options(null: false) }
  end

  describe 'validations' do
    it { should_not allow_value(nil).for(:compatible) }
  end
end

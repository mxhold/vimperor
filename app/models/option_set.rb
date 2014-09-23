require './lib/vimrc_generator'
class OptionSet < ActiveRecord::Base
  validates :compatible, inclusion: { in: [true, false] }

  def generate_file
    VimrcGenerator.generate(attributes.symbolize_keys.except(:id))
  end

  def to_param
    Hashids.new(Rails.application.secrets.hashid_salt, 6).encode(id)
  end
end

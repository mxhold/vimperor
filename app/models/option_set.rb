class OptionSet < ActiveRecord::Base
  validates :compatible, inclusion: { in: [true, false] }

  def to_param
    Hashids.new(Rails.application.secrets.hashid_salt, 6).encode(id)
  end
end

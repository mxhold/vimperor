class OptionSet < ActiveRecord::Base
  store_accessor :options, :compatible
  
  validates :options, presence: true

  def to_param
    Hashids.new(Rails.application.secrets.hashid_salt, 6).encode(id)
  end

  def compatible?
    compatible == 'true'
  end
end

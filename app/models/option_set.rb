class OptionSet < ActiveRecord::Base
  store_accessor :options, :compatible, :leader

  validates :options, presence: true

  def to_param
    Hashid.encode(id)
  end

  def compatible?
    compatible == 'true'
  end
end

class OptionSet < ActiveRecord::Base
  def to_param
    Hashid.encode(id)
  end
end

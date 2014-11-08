class OptionSet < ActiveRecord::Base
  def to_param
    Hashid.encode(id)
  end

  def form_attributes
    OptionConfig.form_attributes(options)
  end
end

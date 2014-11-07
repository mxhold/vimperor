require 'active_model'
class OptionSetForm
  include ActiveModel::Model

  attr_accessor :creator_ip

  validates :creator_ip, presence: true

  def submit
    if valid?
      OptionSet.create!(option_set_attributes)
    else
      self
    end
  end

  OptionConfig.options.each do |option|
    attr_accessor option
  end

  private

  def option_set_attributes
    {
      options: OptionConfig.new(self).attributes,
      creator_ip: creator_ip
    }
  end
end

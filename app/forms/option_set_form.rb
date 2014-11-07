require 'active_model'
class OptionSetForm
  include ActiveModel::Model

  OptionConfig.options.each do |option|
    attr_accessor option
  end

  attr_accessor :creator_ip

  def initialize(attributes = default_attributes)
    super(attributes)
  end

  validates :creator_ip, presence: true

  def submit
    if valid?
      OptionSet.create!(option_set_attributes)
    else
      self
    end
  end

  private

  def default_attributes
    OptionConfig.default_attributes
  end

  def option_set_attributes
    {
      options: OptionConfig.new(self).attributes,
      creator_ip: creator_ip
    }
  end
end

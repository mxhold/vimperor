require 'action_view'
require 'yaml'
require_relative 'options/type'
require_relative 'options/option'
require_relative 'options/registry'
require_relative 'options/option_registry'

module Options
  CONFIG_PATH = "#{__dir__}/options/config.yml"

  def self.find(name)
    registry.find(name)
  end

  def self.registry
    @registry ||= OptionRegistry.new(CONFIG_PATH)
  end
  private_class_method :registry
end

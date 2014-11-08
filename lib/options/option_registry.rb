module Options
  module OptionRegistry
    def self.new(config_path)
      OptionRegistryFactory.new(config_path).registry
    end

    class OptionRegistryFactory
      def initialize(config_path)
        @config_path = File.expand_path(config_path)
        @registry = Registry.new('Option')
      end

      def options
        @options ||= YAML.load(File.open(@config_path))['options']
      end

      # rubocop:disable Metrics/MethodLength
      def registry
        options.each do |name, attributes|
          option = Option.new(
            name: name,
            label: attributes.fetch('label'),
            doc_url: attributes.fetch('doc_url'),
            help_text: attributes.fetch('help_text'),
            default_value: attributes.fetch('default_value'),
            field_type: attributes.fetch('field_type'),
          )
          @registry.register(name, option)
        end
        @registry
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end

module ArrayExtensions
  module DeepToH
    refine Array do
      # rubocop:disable Metrics/MethodLength
      def deep_to_h
        map do |key, value|
          if value.is_a?(Array)
            [key, value.deep_to_h]
          else
            [key, value]
          end
        end.to_h
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end

module TypeCoersion
  def self.coercer_for(type)
    const_get("#{type.capitalize}Coercer")
  end

  class HashCoercer
    using ArrayExtensions::DeepToH

    def initialize(config:)
      @config = config
    end

    def coerce(hash)
      coerce_hash(hash)
    end

    private

    attr_reader :config

    def coerce_hash(hash, nested_keys: [])
      hash.map do |key, value|
        [key, deep_coerce_value(key, value, nested_keys.dup)]
      end.deep_to_h
    end

    def deep_coerce_value(key, value, nested_keys)
      if value.is_a?(Hash)
        coerce_hash(value, nested_keys: nested_keys.push(key))
      else
        coerce_value(value, type_for(nested_keys, key))
      end
    end

    def coerce_value(value, type)
      TypeCoersion.coercer_for(type).coerce(value)
    end

    def type_for(*keys)
      keys.flatten.compact.reduce(config) do |config, option|
        config[option.to_sym]
      end
    end
  end

  class IntegerCoercer
    def self.coerce(value)
      value.to_i if value
    end
  end

  class StringCoercer
    def self.coerce(value)
      string_value = value.to_s
      string_value unless string_value.empty?
    end
  end

  class BooleanCoercer
    def self.coerce(value)
      %w( true 1 ).include?(value.to_s) unless value.nil?
    end
  end
end

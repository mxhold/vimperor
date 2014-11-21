Dir["#{__dir__}/type/*.rb"].each { |file| require file }
module Options
  module Type
    def self.new(field_type:, field_name:)
      type_class = const_get(field_type.to_s.split('_').map(&:capitalize).join)
      type_class.new(field_name: field_name)
    rescue
      raise ArgumentError, "Unknown option type: #{field_type}"
    end
  end
end

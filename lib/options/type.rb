require_relative './type/boolean'
module Options
  module Type
    def self.new(name)
      const_get(name.to_s.split('_').map(&:capitalize).join)
    rescue
      raise ArgumentError, "Unknown option type: #{name}"
    end
  end
end

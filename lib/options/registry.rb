require 'active_support/hash_with_indifferent_access'
module Options
  class Registry
    attr_reader :name
    def initialize(name)
      @name = name
      @items = ActiveSupport::HashWithIndifferentAccess.new
    end

    def register(item_name, item)
      if registered?(item_name)
        fail ArgumentError, "#{name} already registered: #{item_name}"
      else
        @items.store(item_name, item)
      end
    end

    def find(item_name)
      if registered?(item_name)
        @items.fetch(item_name)
      else
        fail ArgumentError, "#{name} not registered: #{item_name}"
      end
    end

    def registered?(item_name)
      @items.key?(item_name)
    end
  end
end

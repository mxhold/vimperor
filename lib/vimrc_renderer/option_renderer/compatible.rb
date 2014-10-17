module VimrcRenderer
  module OptionRenderer
    class Compatible
      def initialize(compatible)
        @setting = compatible ? 'compatible' : 'nocompatible'
      end

      def render
        "set #{setting}"
      end

      private

      attr_reader :setting
    end
  end
end

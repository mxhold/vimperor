module VimrcRenderer
  module OptionRenderer
    class Expandtab
      def initialize(expandtab)
        @setting = expandtab ? 'expandtab' : 'noexpandtab'
      end

      def render
        "set #{setting}"
      end

      private

      attr_reader :setting
    end
  end
end

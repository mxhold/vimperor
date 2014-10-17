module VimrcRenderer
  module OptionRenderer
    class Backspace
      def initialize(indent:, eol:, start:)
        @settings = []
        @settings << 'indent' if indent
        @settings << 'eol' if eol
        @settings << 'start' if start
      end

      def render
        "set backspace=#{settings.join(',')}"
      end

      private

      attr_reader :settings
    end
  end
end

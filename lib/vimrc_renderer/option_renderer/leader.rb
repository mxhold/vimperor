module VimrcRenderer
  module OptionRenderer
    class Leader
      def initialize(leader_key)
        @leader_key = leader_key
      end

      def render
        "let mapleader=\"#{leader_key}\""
      end

      private

      attr_reader :leader_key
    end
  end
end

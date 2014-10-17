module VimrcRenderer
  module OptionRenderer
    class TabWidth
      def initialize(tab_width)
        @tab_width = tab_width
      end

      def render
        <<-eos
set tabstop=#{tab_width}
set shiftwidth=#{tab_width}
set shiftround
eos
      end

      private

      attr_reader :tab_width
    end
  end
end

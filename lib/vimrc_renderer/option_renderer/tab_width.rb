module VimrcRenderer
  module OptionRenderer
    class TabWidth
      def initialize(tab_width)
        @tab_width = tab_width
      end

      def render
        "set tabstop=#{tab_width}\nset shiftwidth=#{tab_width}\nset shiftround\n"
      end

      private

      attr_reader :tab_width
    end
  end
end

module VimrcRenderer
  module OptionRenderer
    class Compatible
      def initialize(on)
        @on = on
      end

      def render
        if @on
          "set compatible"
        else
          "set nocompatible"
        end
      end
    end
  end
end

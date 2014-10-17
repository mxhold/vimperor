module VimrcRenderer
  module OptionRenderer
    class List
      def initialize(options)
        @enabled = options[:list]
        @options = options.reject { |key, _| key == :list }
      end

      def render
        "set #{list}"
      end

      private

      attr_reader :options, :enabled

      def list
        if enabled
          enabled_list
        else
          'nolist'
        end
      end

      def enabled_list
        if !listchars.empty?
          "list listchars=#{listchars}"
        else
          'list'
        end
      end

      def listchars
        types.map do |type|
          option_for(type) if valid_option_for?(type)
        end.compact.join(',')
      end

      # rubocop:disable Metrics/MethodLength
      def types
        [
          :eol,
          :tab,
          :trail,
          :extends,
          :precedes,
          :nbsp,
        ]
      end
      # rubocop:enable Metrics/MethodLength

      def option_for(type)
        "#{type}:#{options[type]}"
      end

      def valid_option_for?(type)
        if type == :tab
          options[type] && options[type].length == 2
        else
          options[type]
        end
      end
    end
  end
end

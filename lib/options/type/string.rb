module Options
  module Type
    class String
      def initialize(field_name:)
        @field_name = field_name
      end

      def form_fields(form)
        FormHelper.new(form).text_field(field_name)
      end

      def render(value)
        "let #{field_name}=\"#{value}\""
      end

      private

      attr_reader :field_name
    end
  end
end

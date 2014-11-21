module Options
  module Type
    class String
      include ActionView::Context
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper

      def initialize(field_name:)
        @field_name = field_name
      end

      def form_fields(form)
        form.text_field(field_name)
      end

      def render(value)
        "set #{field_name}=#{value}"
      end

      private

      attr_reader :field_name
    end
  end
end

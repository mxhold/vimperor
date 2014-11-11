module Options
  module Type
    class Boolean
      include ActionView::Context
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper

      def initialize(field_name:, true_label: 'On', false_label: 'Off')
        @field_name = field_name
        @true_label = true_label
        @false_label = false_label
      end

      # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      def form_fields(form)
        content_tag(:div, class: 'radio') do
          concat(form.label(field_name, value: true) do
            form.radio_button(field_name, true) + true_label
          end)
          concat(content_tag(:div, class: 'radio') do
            form.label(field_name, value: false) do
              form.radio_button(field_name, false) + false_label
            end
          end)
        end
      end
      # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

      def render(value)
        if value
          "set #{field_name}"
        else
          "set no#{field_name}"
        end
      end

      private

      attr_reader :field_name, :false_label, :true_label
    end
  end
end

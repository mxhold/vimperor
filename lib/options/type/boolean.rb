module Options
  module Type
    class Boolean
      include ActionView::Context
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper

      # rubocop:disable Metrics/ParameterLists, Metrics/LineLength
      def initialize(field_name:, default_value:, true_label: 'On', false_label: 'Off')
        @field_name = field_name
        @default_value = default_value
        @true_label = true_label
        @false_label = false_label
      end
      # rubocop:enable Metrics/ParameterLists, Metrics/LineLength

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

      private

      attr_reader :field_name, :default_value, :false_label, :true_label
    end
  end
end

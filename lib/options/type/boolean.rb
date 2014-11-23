module Options
  module Type
    class Boolean
      def initialize(field_name:, true_label: 'On', false_label: 'Off')
        @field_name = field_name
        @true_label = true_label
        @false_label = false_label
      end

      def form_fields(form)
        FormHelper.concat_fields(form) do |f|
          f.radio_field(field_name, value: true, label: true_label)
          f.radio_field(field_name, value: false, label: false_label)
        end
      end

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

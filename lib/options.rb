require 'action_view'
module Options
  class Compatible
    def self.label
      'Vi compatibility'
    end

    def self.doc_url
      "http://vimdoc.sourceforge.net/htmldoc/options.html#'compatible'"
    end

    def self.help_text
      'Adds backwards-compatibility with the Vi editor by turning off many Vim features'
    end

    def self.form_fields(form)
      BooleanOption.new(field_name: :compatible, default_value: false).form_fields(form)
    end
  end

  class BooleanOption
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper

    def initialize(field_name:, default_value:, true_label: 'On', false_label: 'Off')
      @field_name = field_name
      @default_value = default_value
      @true_label = true_label
      @false_label = false_label
    end

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

    private

    attr_reader :field_name, :default_value, :false_label, :true_label
  end
end

require 'action_view'
module Options
  class Compatible
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper

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
      new.form_fields(form)
    end

    def form_fields(form)
      content_tag(:div, class: 'radio') do
        concat(form.label(:compatible, value: true) do
          form.radio_button(:compatible, true) + 'On'
        end)
        concat(content_tag(:div, class: 'radio') do
          form.label(:compatible, value: false) do
            form.radio_button(:compatible, false, checked: true) + 'Off (recommended)'
          end
        end)
      end
    end
  end
end

module Options
  class FormHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper

    def initialize(form)
      @form = form
      @buffer = ''.html_safe
    end

    def self.concat_fields(form)
      yield new(form)
    end

    def radio_field(name, value:, label:)
      buffer.concat(
        radio(name, value: value, label: label)
      )
    end

    def text_field(name)
      buffer.concat(
        text(name)
      )
    end

    private

    attr_reader :form, :buffer

    def radio(name, value:, label:)
      content_tag(:div, class: 'radio') do
        form.label(name, value: value) do
          form.radio_button(name, value) + label
        end
      end
    end

    def text(name)
      form.text_field(
        name,
        class: "form-control #{name}",
        data: { action: 'selectContents' }
      )
    end
  end
end

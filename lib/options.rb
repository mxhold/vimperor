require 'action_view'
require 'yaml'
require_relative 'options/registry'
require_relative 'options/option_registry'

module Options
  CONFIG_PATH = "#{__dir__}/options/config.yml"

  def self.find(name)
    registry.find(name)
  end

  def self.registry
    @registry ||= OptionRegistry.new(CONFIG_PATH)
  end
  private_class_method :registry

  class Option
    attr_reader :name, :label, :doc_url, :help_text
    def initialize(name:, label:, doc_url:, help_text:, field_type:, default_value:)
      @name = name
      @label = label
      @doc_url = doc_url
      @help_text = help_text
      @field_type = field_type.to_sym
      @default_value = default_value
    end

    def form_fields(form)
      form_field_renderer.form_fields(form)
    end

    private

    attr_reader :field_type, :default_value

    def form_field_renderer
      form_field_factory.new(
        field_name: name,
        default_value: default_value
      )
    end

    def form_field_factory
      case field_type
      when :boolean
        BooleanOption
      else
        raise "Unknown form field type: #{field_type}"
      end
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

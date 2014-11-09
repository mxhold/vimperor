module Options
  class Option
    attr_reader :name, :label, :doc_url, :help_text
    # rubocop:disable Metrics/MethodLength, Metrics/ParameterLists, Metrics/LineLength
    def initialize(name:, label:, doc_url:, help_text:, field_type:, default_value:)
      @name = name
      @label = label
      @doc_url = doc_url
      @help_text = help_text
      @field_type = field_type.to_sym
      @default_value = default_value
    end
    # rubocop:enable Metrics/MethodLength, Metrics/ParameterLists, Metrics/LineLength

    def form_fields(form)
      type.form_fields(form)
    end

    def render(value)
      type.render(value)
    end

    private

    attr_reader :field_type, :default_value

    def type
      Type.new(field_type).new(
        field_name: name,
        default_value: default_value
      )
    end
  end
end

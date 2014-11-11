module Options
  class Option
    attr_reader :name, :label, :doc_url, :help_text
    # rubocop:disable Metrics/MethodLength, Metrics/ParameterLists
    def initialize(name:, label:, doc_url:, help_text:, field_type:)
      @name = name
      @label = label
      @doc_url = doc_url
      @help_text = help_text
      @field_type = field_type.to_sym
    end
    # rubocop:enable Metrics/MethodLength, Metrics/ParameterLists

    def form_fields(form)
      type.form_fields(form)
    end

    def render(value)
      type.render(value)
    end

    private

    attr_reader :field_type, :default_value

    def type
      Type.new(
        field_type: field_type,
        field_name: name,
      )
    end
  end
end

class OptionSet < ActiveRecord::Base
  validates :options, presence: true

  # rubocop:disable Metrics/MethodLength
  def self.valid_options
    [
      :compatible,
      :leader,
      :backspace_indent,
      :backspace_eol,
      :backspace_start,
      :expandtab,
      :tab_width,
      :list,
      :listchars_trail,
      :listchars_tab_first,
      :listchars_tab_rest,
      :listchars_eol,
      :listchars_nbsp,
      :listchars_extends,
      :listchars_precedes
    ]
  end
  # rubocop:enable Metrics/MethodLength

  store_accessor :options, valid_options

  def to_param
    Hashid.encode(id)
  end
end

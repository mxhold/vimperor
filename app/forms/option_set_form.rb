require 'active_model'
class OptionSetForm
  include ActiveModel::Model

  attr_accessor :creator_ip

  validates :creator_ip, presence: true

  def submit(option_set_class = OptionSet)
    if valid?
      option_set_class.create!(option_set_attributes)
    else
      self
    end
  end

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

  valid_options.each do |option|
    attr_accessor option
  end

  private

  def option_set_attributes
    {
      options: option_attributes,
      creator_ip: creator_ip
    }
  end

  # rubocop:disable Metrics/MethodLength
  def option_attributes
    {
      compatible: compatible,
      leader: leader,
      backspace: {
        indent: backspace_indent,
        eol: backspace_eol,
        start: backspace_start,
      },
      expandtab: expandtab,
      tab_width: tab_width,
      list: {
        list: list,
        trail: listchars_trail,
        tab: "#{listchars_tab_first}#{listchars_tab_rest}",
        eol: listchars_eol,
        nbsp: listchars_nbsp,
        extends: listchars_extends,
        precedes: listchars_precedes,
      }
    }
  end
  # rubocop:enable Metrics/MethodLength
end

require 'delegate'
class OptionConfig < SimpleDelegator
  def self.option_types
    {
      compatible: :boolean,
      leader: :string,
      backspace: {
        indent: :boolean,
        eol: :boolean,
        start: :boolean,
      },
      expandtab: :boolean,
      tab_width: :integer,
      list: {
        list: :boolean,
        trail: :string,
        tab: :string,
        eol: :string,
        nbsp: :string,
        extends: :string,
        precedes: :string,
      }
    }
  end

  def self.options
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

  def attributes
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
end


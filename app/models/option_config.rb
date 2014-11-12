require 'delegate'
# rubocop:disable Metrics/ClassLength
class OptionConfig < SimpleDelegator
  # rubocop:disable Metrics/MethodLength
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

  def self.normal_options
    [
      :compatible,
      :expandtab
    ]
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

  def self.default_attributes
    {
      compatible: false,
      leader: ' ',
      backspace_indent: true,
      backspace_eol: true,
      backspace_start: true,
      expandtab: true,
      tab_width: 2,
      list: true,
      listchars_trail: '·',
      listchars_tab_first: '»',
      listchars_tab_rest: '·',
      listchars_eol: '',
      listchars_nbsp: '',
      listchars_extends: '',
      listchars_precedes: '',
    }
  end

  # rubocop:disable Metrics/AbcSize
  def self.form_attributes(options)
    {
      compatible: options['compatible'],
      leader: options['leader'],
      backspace_indent: options.fetch('backspace', {})['indent'],
      backspace_eol: options.fetch('backspace', {})['eol'],
      backspace_start: options.fetch('backspace', {})['start'],
      expandtab: options['expandtab'],
      tab_width: options['tab_width'],
      list: options.fetch('list', {})['list'],
      listchars_trail: options.fetch('list', {})['trail'],
      listchars_tab_first: options.fetch('list', {}).fetch('tab', '')[0],
      listchars_tab_rest: options.fetch('list', {}).fetch('tab', '')[1],
      listchars_eol: options.fetch('list', {})['eol'],
      listchars_nbsp: options.fetch('list', {})['nbsp'],
      listchars_extends: options.fetch('list', {})['extends'],
      listchars_precedes: options.fetch('list', {})['precedes'],
    }
  end
  # rubocop:enable Metrics/AbcSize

  def attributes
    {
      'compatible' => compatible,
      'leader' => leader,
      'backspace' => {
        'indent' => backspace_indent,
        'eol' => backspace_eol,
        'start' => backspace_start,
      },
      'expandtab' => expandtab,
      'tab_width' => tab_width,
      'list' => {
        'list' => list,
        'trail' => listchars_trail,
        'tab' => "#{listchars_tab_first}#{listchars_tab_rest}",
        'eol' => listchars_eol,
        'nbsp' => listchars_nbsp,
        'extends' => listchars_extends,
        'precedes' => listchars_precedes,
      }
    }
  end
  # rubocop:enable Metrics/MethodLength
end
# rubocop:enable Metrics/ClassLength

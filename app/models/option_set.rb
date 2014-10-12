class OptionSet < ActiveRecord::Base
  validates :options, presence: true

  def self.valid_options
    [
      :compatible,
      :leader,
      :backspace_indent,
      :backspace_eol,
      :backspace_start,
      :expandtab,
      :tab_width
    ]
  end
 
  store_accessor :options, valid_options

  def to_param
    Hashid.encode(id)
  end
end

require_dependency '../../lib/options'

module OptionManager
  def self.new(option)
    case option
    when :compatible
      Options::Compatible.new
    end
  end
end

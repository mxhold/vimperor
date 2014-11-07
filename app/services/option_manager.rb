module OptionManager
  def self.new(option)
    case option
    when :compatible
      Options::Compatible
    end
  end
end

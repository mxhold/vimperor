class VimrcGenerator
  def self.generate(options)
    if options[:compatible]
      "set compatible\n"
    else
      "set nocompatible\n"
    end
  end
end

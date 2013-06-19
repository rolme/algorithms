class Logger

  # Public: Keep functionality and post to standard out.
  #
  # Returns Boolean.
  alias :_info :info

  define_method :info do |s|
    out = self.send(:_info, s)
    puts s
    out
  end
end

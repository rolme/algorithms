class Numeric

  # Public: Divide a number by divisor then round up.
  #
  # This is faster than using:
  #  (dividend.to_f / divisor.to_f).ceil
  #
  # Examples
  #   6.round_up_after_divide_by(2)  # => 3
  #   5.round_up_after_divide_by(2)  # => 3
  #   5.round_up_after_divide_by(3)  # => 2
  #
  # Returns Integer.
  def round_up_after_divide_by(divisor)
    (self + (divisor - 1)) / divisor
  end
end

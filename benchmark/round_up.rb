require 'benchmark'

# When rounding up integer division, it is best to:
#
# Add the max remainder and let Ruby round down.
# (dividend + (divisor - 1)) / divisor
fraction = {
  :dividend => rand(100..1000),
  :divisor  => rand(2..10)
}

Benchmark.bm(20) do |b|
  b.report('Float#ceil') do
    10_000_000.times {
      (fraction[:dividend].to_f / fraction[:divisor].to_f).ceil
    }
  end

  b.report('has remainder?') do
    10_000_000.times {
      (fraction[:dividend] / fraction[:divisor]) + (fraction[:dividend] % fraction[:divisor] > 0 ? 1 : 0)
     }
  end

  b.report('+ max remainder') do
    10_000_000.times {
      (fraction[:dividend] + (fraction[:divisor] - 1)) / fraction[:divisor]
     }
  end
end

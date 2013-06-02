require 'benchmark'

fraction = {
  :dividend => rand(100..1000),
  :divisor  => rand(2..10)
}

Benchmark.bm do |b| 
  b.report('Float#ceil    ') do
    10_000_000.times {
      (fraction[:dividend].to_f / fraction[:divisor].to_f).ceil
    }
  end

  b.report('has remainder?') do
    10_000_000.times { 
      (fraction[:dividend] / fraction[:divisor]) + (fraction[:dividend] % fraction[:divisor] > 0 ? 1 : 0)
     }
  end

  b.report('+ remainder   ') do
    10_000_000.times { 
      (fraction[:dividend] + (fraction[:divisor] - 1)) / fraction[:divisor]
     }
  end
end

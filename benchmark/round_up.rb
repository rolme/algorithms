require 'benchmark'

Benchmark.bm do |b| 
  b.report('#ceil') do
    10_000_000.times {
      devidend = rand(10..1000)
      devisor  = rand(2..10)

      (devidend.to_f / devisor.to_f).ceil
    }
  end

  b.report('Integer Rounding') do
    10_000_000.times { 
      devidend = rand(10..1000)
      devisor  = rand(2..10)

      (devidend + (devisor - 1)) / devisor
     }
  end
end

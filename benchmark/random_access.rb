require 'benchmark'

# When randomly accessing an element in an array
# Array#sample is fastest

Benchmark.bm do |b|  
  a = (1..1_000_000).to_a

  b.report('#rand(1_000_000)') do
    1_000_000.times do
      a[rand(1_000_000)]
    end
  end

  b.report('#rand(1..1_000_000)') do
    1_000_000.times do
      a[rand(1..1_000_000)]
    end
  end

  b.report('Array#sample') do
    1_000_000.times do
      a.sample
    end
  end
end
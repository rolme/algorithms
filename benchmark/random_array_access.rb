require 'benchmark'

# When randomly accessing an element in an array
# Array#sample is fastest

list = Array.new(1_000_000)

Benchmark.bm(20) do |b|
  b.report('rand(1_000_000)') do
    1_000_000.times do
      list[rand(1_000_000)]
    end
  end

  b.report('rand(1..1_000_000)') do
    1_000_000.times do
      list[rand(1..1_000_000)]
    end
  end

  b.report('Array#sample') do
    1_000_000.times do
      list.sample
    end
  end
end
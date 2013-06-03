require 'benchmark'

# When randomizing a boolean, it is fastest to use:
#
#  [true,false].sample  #=> ruby 2.0.0
#
Benchmark.bm(20) do |b|
  b.report('rand(2)') do
    1_000_000.times do
      rand(2) == 1 ? true : false
    end
  end

  b.report('rand(0..1)') do
    1_000_000.times do
      rand(0..1) == 1 ? true : false
    end
  end

  b.report('[true,false].sample') do
    1_000_000.times do
      [true,false].sample
    end
  end
end
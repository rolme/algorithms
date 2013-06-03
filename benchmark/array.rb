require 'benchmark'

# When adding to an Array its best to use:
#
#  [x,y] << z  # Using ruby 2.0.0
#
Benchmark.bm(7) do |b|

  b.report('#+') do
    animals = ["insane walrus", "maniacal otter", "eloquent raccoon"]
    1_000_000.times do
      basket = []
      animals.each do |a|
        basket += [a]
      end
    end
  end

  b.report('#<<') do
    animals = ["insane walrus", "maniacal otter", "eloquent raccoon"]
    1_000_000.times do      
      basket = []
      animals.each do |a|
        basket << a
      end
    end
  end

  b.report('#push') do
    animals = ["insane walrus", "maniacal otter", "eloquent raccoon"]
    1_000_000.times do
      basket = []
      animals.each do |a|
        basket.push a
      end
    end
  end

  b.report('#pipe') do
    animals = ["insane walrus", "maniacal otter", "eloquent raccoon"]
    1_000_000.times do
      basket = []
      animals.each do |a|
        basket | [a]
      end
    end
  end

  b.report('#concat') do
    animals = ["insane walrus", "maniacal otter", "eloquent raccoon"]
    1_000_000.times do
      basket = []
      animals.each do |a|
        basket.concat [a]
      end
    end
  end
end
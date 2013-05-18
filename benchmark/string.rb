require 'benchmark'

Benchmark.bm do |b| 
  b.report('+') do
    hyper = "hyper"
    crypto = "crypto"
    monkey = "monkey"

    10_000_000.times { hyper + crypto + monkey }
  end

  b.report('<<') do
    hyper = "hyper"
    crypto = "crypto"
    monkey = "monkey"

    10_000_000.times { hyper << crypto << monkey }
  end

  b.report('#{}') do
    hyper = "hyper"
    crypto = "crypto"
    monkey = "monkey"

    10_000_000.times { "#{hyper}#{crypto}#{monkey}" }
  end

  b.report('#concat') do
    hyper = "hyper"
    crypto = "crypto"
    monkey = "monkey"

    10_000_000.times { hyper.concat(crypto).concat(monkey) }
  end
end

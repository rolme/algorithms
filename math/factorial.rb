def factorial(n)
  raise ArgumentError, "Argument cannot be a negative number" if (n < 0)
  return 1 if n <= 1
  n * factorial(n - 1)
end

if $0 == __FILE__
  [4, 3, 2, 1, 0].each do |n|
    puts n.to_s << "! = " << factorial(n).to_s
  end

  n = (5..25).to_a.sample
  puts n.to_s << "! = " << factorial(n).to_s
end

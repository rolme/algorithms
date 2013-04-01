#!/Users/rparnaso/.rvm/rubies/ruby-2.0.0-p0/bin/ruby

def factorial(n)
  raise ArgumentError, "Argument cannot be a negative number" if (n < 0)
  return 1 if (n <= 1)
  return n * factorial(n-1)
end

if $0 == __FILE__
  [4, 3, 2, 1, 0].each do |n|
    x = factorial n
    puts "#{n}! = #{x}"
  end
  
  n = rand(5..25)
  x = factorial n
  puts "#{n}! = #{x}"
end

# PROBLEM: Imagine you landed a new job as a cashier...
#
# DESCRIPTION:
# Your quirky boss found out that you're a programmer and has a weird request
# about something they've been wondering for a long time.

# Write a function that, given:

# an amount of money
# - a list of coin denominations
# - computes the number of ways to make amount of money with coins of the
#   available denominations.

# Example: for amount= $0.12 with these denominations: [1, 5, 10, 25]
#
# 10, 1, 1
# 5, 5, 1, 1
# 5, 1, 1, 1, 1, 1, 1, 1
# 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

def change1(total, denominations)
  breakdowns = []

  denominations.each_with_index do |coin, index|
    next if total/coin == 0

    subtotal = total
    set = []
    count = subtotal / coin

    if count > 0
      count.times { set << coin }
      subtotal -= (coin * count)
    end

    if subtotal > 0
      set += change1(subtotal, denominations[index+1..-1])
    end
    breakdowns << set.flatten
  end
  breakdowns
end

# Lets use memoization. This is top
class ChangeMakerMemo
  attr_accessor :memo

  def initialize
    @memo = {}
  end

  def change(amount, denominations)
    memo_key = "#{amount}, #{denominations}"

    if memo.keys.include?(memo_key)
      puts "found memo #{memo_key}"
      return memo[memo_key]
    end

    return 1 if amount == 0              # we found change!
    return 0 if amount < 0               # we overshot...
    return 0 if denominations.count == 0 # we are out of coins

    denomination, remaining_denominations = denominations[0], denominations[1..-1]
    possibilities = 0
    while (amount >= 0)
      possibilities += change(amount, remaining_denominations)
      amount -= denomination

      self.memo[memo_key] = possibilities
    end
    return possibilities
  end
end

# Lets go bottom up.
def change2(amount, denominations)
  denomination_breakdown = Array.new(amount + 1, 0)
  denomination_breakdown[0] = 1

  denominations.each do |denomination|
    (denomination..amount).each do |higher_amount|
      remainder = higher_amount - denomination
      denomination_breakdown[higher_amount] += denomination_breakdown[remainder]
    end
  end

  denomination_breakdown[amount]
end



if $0 == __FILE__
  list   = [2, 3, 7]
  amount = 14
  puts "[#{list.join(', ')}]"
  puts "#{change1(amount, list)}"
  puts "#{ChangeMakerMemo.new.change(amount, list)}"
  puts "#{change2(amount, list)}"
end

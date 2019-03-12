# PROBLEM: Writing coding interview questions hasn't made me rich. Maybe
# trading Apple stocks will.
#
# DESCRIPTION:
# I have an array stock_prices_yesterday where:
#
# * The indices are the time in minutes past trade opening time, which was 9:30am local time.
# * The values are the price in dollars of Apple stock at that time.
# * For example, the stock cost $500 at 10:30am, so stock_prices_yesterday[60] = 500.
#
# Write an efficient algorithm for computing the best profit I could have made
# from 1 purchase and 1 sale of 1 Apple stock yesterday.
#
# No "shorting"—you must buy before you sell. You may not buy and sell in the
# same time step (at least 1 minute must pass).

# Mapped to a Hash but that takes up more memory.
def max_trade1(stock_list)
  mapped_list = stock_list.map.with_index{ |v, i| {index: i, value: v} }
  mapped_list = mapped_list.sort{ |a,b| a[:value] <=> b[:value] }
  buy   = -1
  sell  = max_index = stock_list.count - 1
  found = false
  while buy <= max_index && !found do
    buy = buy + 1
    sell = max_index
    while buy < sell do
      if mapped_list[buy][:index] < mapped_list[sell][:index]
        found = true
        break
      end
      sell = sell - 1
    end
  end

  if mapped_list[buy].nil?
    puts "-1"
  else
    puts "purchase at $#{mapped_list[buy][:value]} #{mapped_list[buy][:index]} and sell at $#{mapped_list[sell][:value]} #{mapped_list[sell][:index]} for profit of #{mapped_list[sell][:value] - mapped_list[buy][:value]}"
  end
end

def max_trade2(stock_list)
  buy  = max_profit = 0
  buy_price = stock_list[buy]
  sell = max_index  = stock_list.count - 1
  sell_price = stock_list[sell]
  (0..max_index).each do |outer|
    (0..max_index).each do |inner|
      earlier_time = [outer, inner].min
      later_time   = [outer, inner].max

      profit = stock_list[later_time] - stock_list[earlier_time]
      if profit > max_profit
        max_profit = profit
        buy        = earlier_time
        buy_price  = stock_list[earlier_time]
        sell       = later_time
        sell_price = stock_list[later_time]
      end
    end
  end

  puts "purchase at $#{buy_price} #{buy} and sell at $#{sell_price} #{sell} for profit of #{max_profit}"
end

def max_trade3(stock_list)
  min_price  = stock_list[0]
  max_profit = buy = 0
  sell = stock_list.count - 1
  buy_price  = stock_list[buy]
  sell_price = stock_list[sell]

  stock_list.each_with_index do |current_price, index|
    profit = current_price - min_price

    if profit > max_profit
      max_profit = profit
      sell       = index
    end

    if (current_price < min_price)
      min_price = current_price
      buy       = index
    end

  end

  puts "purchase at $#{stock_list[buy]} #{buy} and sell at $#{stock_list[sell]} #{sell} for profit of #{max_profit}"
end

# Think greedy! Track the minimum price, and max_profit O(n)
def max_trade4(stock_list)
  raise "Profit requires two prices" unless stock_list.count > 2

  min_price  = stock_list[0]
  max_profit = stock_list[1] - stock_list[0]

  stock_list.each_with_index do |current_price, index|
    next if index == 0

    profit    = current_price - min_price

    profit > max_profit && max_profit = profit

    min_price = [current_price, min_price].min
  end
  puts max_profit
end

if $0 == __FILE__
  list = Array.new(60*7+30).map{ |x| x = 120 + [*-10..10].sample }
  # list = [10, 9, 8, 7, 6, 5, 4]
  # list = [5, 5, 5, 5, 5]
  # puts "[#{list.join(', ')}]"
  puts "List of #{list.count} stock values"
  puts "#{max_trade1(list)}"
  puts "#{max_trade2(list)}"
  puts "#{max_trade3(list)}"
  puts "#{max_trade4(list)}"
end

# PROBLEM: You decide to test if your oddly-mathematical heating company is
# fulfilling its All-Time Max, Min, Mean and Mode Temperature Guarantee™.
#
# DESCRIPTION:
# Write a class TempTracker with these methods:
#
# - insert()—records a new temperature
# - get_max()—returns the highest temp we've seen so far
# - get_min()—returns the lowest temp we've seen so far
# - get_mean()—returns the mean of all temps we've seen so far
# - get_mode()—returns the mode of all temps we've seen so far
#
# Optimize for space and time. Favor speeding up the get_ functions over
# speeding up the insert() function.
#
# get_mean() should return a float, but the rest of the get_ functions can
# return integers. Temperatures will all be inserted as integers. We'll record
# our temperatures in Fahrenheit, so we can assume they'll all be in the range
# 0..110.
class TempTracker
  attr_accessor :occurances,
                :max,
                :min,
                :mean,
                :mode,
                :max_occurances,
                :total,
                :count

  def initialize
    @max = @mean = @mode = @total = @count = @max_occurances = 0
    @min = 110
    @occurances = Array.new(111, 0)
  end

  def insert(temp)
    self.max  = [max, temp].max
    self.min  = [min, temp].min

    self.total += temp
    self.count += 1
    self.mean = total.to_f/count

    self.occurances[temp] += 1
    if occurances[temp] > max_occurances
      self.mode = temp
      self.max_occurances = occurances[temp]
    end
  end
end

if $0 == __FILE__
  temperatures = []
  50.times do
    temperatures << [*0..110].sample
  end

  list = TempTracker.new
  temperatures.each do |temp|
    list.insert(temp)
  end

  puts "temperatures: [#{temperatures.join(' ')}]"
  puts "max : #{list.max}"
  puts "min : #{list.min}"
  puts "mean: #{list.mean}"
  puts "mode: #{list.mode}"
end

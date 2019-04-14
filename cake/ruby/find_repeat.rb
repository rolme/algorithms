# Find a duplicate, Space Edition™.

# We have an array of integers, where:

# The integers are in the range 1..n1..n
# The array has a length of n+1n+1
# It follows that our array has at least one integer which appears at least twice. But it may have several duplicates, and each duplicate may appear more than twice.

# Write a method which finds an integer that appears more than once in our array. (If there are multiple duplicates, you only need to find one of them.)

# We're going to run this method on our new, super-hip MacBook Pro With Retina Display™. Thing is, the damn thing came with the RAM soldered right to the motherboard, so we can't upgrade our RAM. So we need to optimize for space!

# Number of items should be what we expect from 1..n. If more, than that is the side with dup
# If number of items is the same, the total should be equal, side with more or less has dup
# repeat until we find it

# should be 3 
# [1, 1] = 2
# [2, 2] = 4
# [1, 2, 2] = 5

# should be 6
# [1, 2, 2] = 5
# [1, 1, 3] = 5
# [1, 3, 3] = 7
# [1] + [3, 3]
# [1, 1, 1] = 3
def find_repeat(the_array)
  floor   = 1
  ceiling = the_array.length - 1

  while floor < ceiling
    # divide our range 1..n into an upper range and lower range
    # (such that they don't overlap)
    # lower range is floor..midpoint
    # upper range is midpoint + 1..ceiling
    midpoint = floor + (ceiling - floor) / 2
    lower_range_floor, lower_range_ceiling = floor, midpoint
    upper_range_floor, upper_range_ceiling = midpoint + 1, ceiling

    # count number of items in lower range
    items_in_lower_range = the_array.count do |item|
      item >= lower_range_floor && item <= lower_range_ceiling
    end

    distinct_possible_integers_in_lower_range =
      lower_range_ceiling - lower_range_floor + 1

    if items_in_lower_range > distinct_possible_integers_in_lower_range
      # there must be a duplicate in the lower range
      # so use the same approach iteratively on that range
      floor, ceiling = lower_range_floor, lower_range_ceiling
    else
      # there must be a duplicate in the upper range
      # so use the same approach iteratively on that range
      floor, ceiling = upper_range_floor, upper_range_ceiling
    end
  end

  # floor and ceiling have converged
  # we found a number that repeats!
  floor
end

# Tests

def run_tests
  desc = 'just the repeated number'
  actual = find_repeat([1, 1])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'short array'
  actual = find_repeat([1, 2, 3, 2])
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_repeat([1, 2, 5, 5, 5, 5])
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'long array'
  actual = find_repeat([4, 1, 4, 8, 3, 2, 7, 6, 5])
  expected = 4
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests
def single_riffle?(half1, half2, shuffled_deck)

  return false if half1.length != half2.length
  return false if half1.length + half2.length != shuffled_deck.length

  shuffled_deck.each do |card|
    if !half1.empty? && half1.first == card
      half1.shift
    elsif !half2.empty? && half2.first == card
      half2.shift
    else
      return false
    end
  end

  true
end

# Tests

def run_tests
  desc = 'both halves are the same length'
  result = single_riffle?([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6])
  assert_true(result, desc)

  desc = 'halves are different lengths'
  result = single_riffle?([1, 5], [2, 3, 6], [1, 2, 6, 3, 5])
  assert_false(result, desc)

  desc = 'one half is empty'
  result = single_riffle?([], [2, 3, 6], [2, 3, 6])
  assert_false(result, desc)

  desc = 'shuffled deck is missing cards'
  result = single_riffle?([1, 5], [2, 3, 6], [1, 6, 3, 5])
  assert_false(result, desc)

  desc = 'shuffled deck has extra cards'
  result = single_riffle?([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8])
  assert_false(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests

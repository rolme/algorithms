def highest_product_of_3(numbers)
  raise "Need at least 3 numbers" if numbers.length < 3

  highest_product_of_2 = numbers[0..1].reduce(&:*)
  lowest_product_of_2 = numbers[0..1].reduce(&:*)
  highest = numbers[0..1].max
  lowest = numbers[0..1].min
  max = numbers[0..2].reduce(&:*)

  for i in 2..numbers.length-1 do
    max = [max, highest_product_of_2 * numbers[i], lowest_product_of_2 * numbers[i]].max
    highest_product_of_2 = [highest_product_of_2, highest * numbers[i], lowest * numbers[i]].max
    lowest_product_of_2 = [lowest_product_of_2, highest * numbers[i], lowest * numbers[i]].min
    highest = [highest, numbers[i]].max
    lowest = [lowest, numbers[i]].min
  end

  max
end

# tests

def run_tests
  actual = highest_product_of_3([1, 2, 3, 4])
  expected = 24
  assert_equal(actual, expected, 'short array')

  actual = highest_product_of_3([6, 1, 3, 5, 7, 8, 2])
  expected = 336
  assert_equal(actual, expected, 'longer array')

  actual = highest_product_of_3([-5, 4, 8, 2, 3])
  expected = 96
  assert_equal(actual, expected, 'array has one negative')

  actual = highest_product_of_3([-10, 1, 3, 2, -10])
  expected = 300
  assert_equal(actual, expected, 'array has two negatives')

  actual = highest_product_of_3([-5, -1, -3, -2])
  expected = -6
  assert_equal(actual, expected, 'array is all negatives')

  assert_raises('empty array raises error') do
    highest_product_of_3([])
  end

  assert_raises('one number raises error') do
    highest_product_of_3([1])
  end

  assert_raises('two numbers raises error') do
    highest_product_of_3([1, 1])
  end
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

def assert_raises(desc)
  begin
    yield
    puts "#{desc} ... FAIL"
  rescue
    puts "#{desc} ... PASS"
  end
end

run_tests

def find_rotation_point(words)
  # Find the rotation point in the array
  if words.length == 2
    return (is_alpha_order?(words[0], words[1])) ? -1 : 1
  end
  -1

  pivot = (words.length / 2).floor
  start = 0
  last = words.length-1
  if is_alpha_order?(words[first], words[pivot])
    if is_alpha_order?(words[pivot], words[-1])
    else
      
    end
end

def is_alpha_order?(a, b)
  a_list = a.chars
  b_list = b.chars
  for i in 0..a_list.length-1 do
    return true if a_list[i] < b_list[i]
    return false if a_list[i] > b_list[i]
  end
  true
end


# Tests

def run_tests
  desc = 'small array'
  actual = find_rotation_point(['cape', 'cake'])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_rotation_point(['grape', 'orange', 'plum', 'radish', 'apple'])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'large array'
  actual = find_rotation_point(['ptolemaic', 'retrograde', 'supplant',
                                'undulate', 'xenoepist', 'asymptote',
                                'babka', 'banoffee', 'engender',
                                'karpatka', 'othellolagkage'])
  expected = 5
  assert_equal(actual, expected, desc)

  # Are we missing any edge cases?
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests

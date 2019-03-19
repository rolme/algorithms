# In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.
#
# Each order is represented by an "order id" (an integer).
#
# We have our lists of orders sorted numerically already, in arrays. Write a method to merge our arrays of orders into one sorted array.
#
# For example:
#
# my_array     = [3, 4, 6, 10, 11, 15]
# alices_array = [1, 5, 8, 12, 14, 19]
#
# puts merge_arrays(my_array, alices_array)
# prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
def merge_arrays(my_array, alices_array)

  # Combine the sorted arrays into one large sorted array

  # join the arrays together than sort them again
  # walkthrough each item in each array and push into a new array
  return [] if my_array.length == 0 && alices_array.length == 0
  return alices_array if my_array.length == 0
  return my_array if alices_array.length == 0

  merged_array = []
  my_index = 0
  alices_index = 0
  while (my_index < my_array.length || alices_index < alices_array.length)
    if my_index == my_array.length
      merged_array << alices_array[alices_index]
      alices_index += 1
      next
    end

    if alices_index == alices_array.length
      merged_array << my_array[my_index]
      my_index += 1
      next
    end

    if (my_array[my_index] < alices_array[alices_index])
      merged_array << my_array[my_index]
      my_index += 1
    else
      merged_array << alices_array[alices_index]
      alices_index += 1
    end
  end

  merged_array
end

# Tests

def run_tests
  desc = 'both arrays are empty'
  actual = merge_arrays([], [])
  expected = []
  assert_equal(actual, expected, desc)

  desc = 'first array is empty'
  actual = merge_arrays([], [1, 2, 3])
  expected = [1, 2, 3]
  assert_equal(actual, expected, desc)

  desc = 'second array is empty'
  actual = merge_arrays([5, 6, 7], [])
  expected = [5, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'both arrays have some numbers'
  actual = merge_arrays([2, 4, 6], [1, 3, 7])
  expected = [1, 2, 3, 4, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'arrays are different lengths'
  actual = merge_arrays([2, 4, 6, 8], [1, 7])
  expected = [1, 2, 4, 6, 7, 8]
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

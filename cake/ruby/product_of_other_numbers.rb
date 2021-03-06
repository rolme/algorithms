# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
#
# Write a method get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.
#
# For example, given:
#
#   [1, 7, 3, 4]
#
# your method would return:
#
#   [84, 12, 28, 21]
#
# by calculating:
#
#   [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]
#
# Here's the catch: You can't use division in your solution!
# def get_products_of_all_ints_except_at_index(int_array)
#   raise "Array must contain at least two or more integers" if int_array.length <= 1
#   # Make an array with the products.
#   products = []
#   for i in 0..int_array.length-1 do
#     products[i] = 1
#     for j in 0..int_array.length-1 do
#       next if i == j
#       products[i] *= int_array[j]
#     end
#   end
#
#   products
# end

def get_products_of_all_ints_except_at_index(int_array)
  if int_array.length < 2
    raise IndexError, 'Getting the product of numbers at other indices requires at least 2 numbers'
  end

  products_of_all_ints_except_at_index = []

  # for each integer, we find the product of all the integers
  # before it, storing the total product so far each time
  product_so_far = 1
  i = 0
  while i < int_array.length
    products_of_all_ints_except_at_index[i] = product_so_far
    product_so_far *= int_array[i]
    i += 1
  end

  # for each integer, we find the product of all the integers
  # after it. since each index in products already has the
  # product of all the integers before it, now we're storing
  # the total product of all other integers
  product_so_far = 1
  i = int_array.length - 1
  while i >= 0
    products_of_all_ints_except_at_index[i] *= product_so_far
    product_so_far *= int_array[i]
    i -= 1
  end

  products_of_all_ints_except_at_index
end

# tests

def run_tests
  desc = 'short array'
  actual = get_products_of_all_ints_except_at_index([1, 2, 3])
  expected = [6, 3, 2]
  assert_equal(actual, expected, desc)

  desc = 'longer array'
  actual = get_products_of_all_ints_except_at_index([8, 2, 4, 3, 1, 5])
  expected = [120, 480, 240, 320, 960, 192]
  assert_equal(actual, expected, desc)

  desc = 'array has one zero'
  actual = get_products_of_all_ints_except_at_index([6, 2, 0, 3])
  expected = [0, 0, 36, 0]
  assert_equal(actual, expected, desc)

  desc = 'array has two zeros'
  actual = get_products_of_all_ints_except_at_index([4, 0, 9, 1, 0])
  expected = [0, 0, 0, 0, 0]
  assert_equal(actual, expected, desc)

  desc = 'one negative number'
  actual = get_products_of_all_ints_except_at_index([-3, 8, 4])
  expected = [32, -12, -24]
  assert_equal(actual, expected, desc)

  desc = 'all negative numbers'
  actual = get_products_of_all_ints_except_at_index([-7, -1, -4, -2])
  expected = [-8, -56, -14, -28]
  assert_equal(actual, expected, desc)

  desc = 'error with empty array'
  assert_raises(desc) {
    get_products_of_all_ints_except_at_index([])
  }

  desc = 'error with one number'
  assert_raises(desc) {
    get_products_of_all_ints_except_at_index([1])
  }
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

run_tests()

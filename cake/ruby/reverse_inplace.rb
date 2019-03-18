# My first attempt but it required one temp character
# def reverse!(string)
#
#   # Reverse the input string in place
#   left  = 0
#   right = string.length-1
#   char  = string[left]
#
#   while left < right do
#     string[left]  = string[right]
#     string[right] = char
#     left += 1
#     right -= 1
#     char = string[left]
#   end
#
#   string
# end

def reverse!(str)
  left  = 0
  right = str.length - 1

  while left < right

    # swap characters
    str[left], str[right] = str[right], str[left]

    # move towards middle
    left  += 1
    right -= 1
  end
  str
end

def run_tests
  desc = 'empty string'
  string = ''
  reverse!(string)
  expected = ''
  assert_equal(string, expected, desc)

  desc = 'single character string'
  string = 'A'
  reverse!(string)
  expected = 'A'
  assert_equal(string, expected, desc)

  desc = 'longer string'
  string = 'ABCDE'
  reverse!(string)
  expected = 'EDCBA'
  assert_equal(string, expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests

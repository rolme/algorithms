# Write an efficient method that checks whether any permutation ↴ of an input string is a palindrome. ↴
#
# You can assume the input string only contains lowercase letters.
#
# Examples:
#
# "civic" should return true
# "ivicc" should return true
# "civil" should return false
# "livci" should return false
# "But 'ivicc' isn't a palindrome!"
#
# If you had this thought, read the question again carefully. We're asking if any permutation of the string is a palindrome. Spend some extra time ensuring you fully understand the question before starting. Jumping in with a flawed understanding of the problem doesn't look good in an interview.
require 'set'

def has_palindrome_permutation?(string)
  unpaired_characters = Set.new
  string.chars.each do |c|
    if unpaired_characters.include? c
      unpaired_characters.delete(c)
    else
      unpaired_characters.add(c)
    end
  end
  unpaired_characters.length <= 1
end

# Tests

def run_tests
  desc = 'permutation with odd number of chars'
  result = has_palindrome_permutation?('aabcbcd')
  assert_true(result, desc)

  desc = 'permutation with even number of chars'
  result = has_palindrome_permutation?('aabccbdd')
  assert_true(result, desc)

  desc = 'no permutation with odd number of chars'
  result = has_palindrome_permutation?('aabcd')
  assert_false(result, desc)

  desc = 'no permutation with even number of chars'
  result = has_palindrome_permutation?('aabbcd')
  assert_false(result, desc)

  desc = 'empty string'
  result = has_palindrome_permutation?('')
  assert_true(result, desc)

  desc = 'one character string'
  result = has_palindrome_permutation?('a')
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests

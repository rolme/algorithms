# You're working on a secret team solving coded transmissions.
#
# Your team is scrambling to decipher a recent message, worried it's a plot to break into a major European National Cake Vault. The message has been mostly deciphered, but all the words are backward! Your colleagues have handed off the last step to you.
#
# Write a method reverse_words!() that takes a message as a string and reverses the order of the words in place. ↴
#
# For example:
#
#   message = 'cake pound steal'
#
# reverse_words!(message)
#
# puts message
# # prints: 'steal pound cake'
#
# When writing your method, assume the message contains only letters and spaces, and all words are separated by one space.

def reverse_words!(message)

  # Decode the message by reversing the words
  reverse_string!(message, 0, message.length-1)
  start = 0
  for i in start..message.length do
    if (message[i] == ' ')
      reverse_string!(message, start, i-1)
      start = i + 1
    end

    reverse_string!(message, start, i) if (i == message.length-1)
  end
  message
end

def reverse_string!(str, left, right)
  while left < right
    str[left], str[right] = str[right], str[left]
    left += 1
    right -= 1
  end
end


# Tests

def run_tests
  desc = 'one word'
  message = 'vault'
  reverse_words!(message)
  expected = 'vault'
  assert_equal(message, expected, desc)

  desc = 'two words'
  message = 'thief cake'
  reverse_words!(message)
  expected = 'cake thief'
  assert_equal(message, expected, desc)

  desc = 'three words'
  message = 'one another get'
  reverse_words!(message)
  expected = 'get another one'
  assert_equal(message, expected, desc)

  desc = 'multiple words same length'
  message = 'rat the ate cat the'
  reverse_words!(message)
  expected = 'the cat ate the rat'
  assert_equal(message, expected, desc)

  desc = 'multiple words different lengths'
  message = 'yummy is cake bundt chocolate'
  reverse_words!(message)
  expected = 'chocolate bundt cake is yummy'
  assert_equal(message, expected, desc)

  desc = 'empty string'
  message = ''
  reverse_words!(message)
  expected = ''
  assert_equal(message, expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests

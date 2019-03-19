def is_single_riffle?(shuffled_deck)
  standard_deck = [*1..52]
  single_riffle_deck = riffle(standard_deck)

  for i in 0..25 do
    return false unless [single_riffle_deck[i], single_riffle_deck[i+1]].include?(shuffled_deck[i])
  end
  true
end

def riffle(deck)
  # Rails
  # first_half, second_half = deck.split(26)

  # Ruby
  first_half  = deck.slice(0,25)
  second_half = deck.slice(26,51)
  shuffled_deck = []

  26.times do
    if !![0,1].sample
      shuffled_deck << first_half.shift
      shuffled_deck << second_half.shift
    else
      shuffled_deck << second_half.shift
      shuffled_deck << first_half.shift
    end
  end
  shuffled_deck
end


# Tests

def run_tests
  desc = 'unshuffled deck'
  deck = [*1..52]
  puts "#{deck[0..10].join(', ')}"
  expected = true
  assert_equal(is_single_riffle?(deck), expected, desc)

  desc = 'single riffle deck'
  deck = riffle([*1..52])
  puts "#{deck[0..10].join(', ')}"
  expected = true
  assert_equal(is_single_riffle?(deck), expected, desc)

  desc = 'double riffle deck'
  deck = riffle( riffle([*1..52]) )
  puts "#{deck[0..10].join(', ')}"
  expected = false
  assert_equal(is_single_riffle(deck), expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests

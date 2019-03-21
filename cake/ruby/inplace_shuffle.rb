def get_random(floor, ceiling)
  rand(floor..ceiling)
end

def shuffle(the_array)

  # Shuffle the input in place
  shuffled = []
  the_array.each.with_index do |value, index|
    random_index = get_random(index, the_array.length-1)
    puts "card: #{random_index}"
    puts "value: #{value}"

    the_array[index], the_array[random_index] = the_array[random_index], the_array[index]
  end
end

sample_array = [1, 2, 3, 4, 5]
puts "Sample array: #{sample_array}"

puts 'Shuffling sample array...'
shuffle(sample_array)
puts sample_array.inspect

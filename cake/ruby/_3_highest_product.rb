# PROBLEM: Given an array_of_ints, find the highest_product you can get from
# three of the integers.
#
# DESCRIPTION:
# The input array_of_ints will always have at least three integers.
#
# [1, 7, 3, 4] #=> 84

# O(n log n) speed but does not take into account - numbers
def highest_product1(list)
  raise "Need at least three" unless list.count > 2
  print "Altough logically sorting seems correct, two negative numbers does create a positive: "
  list.sort { |a,b| a <=> b }.pop(3).reduce(:*)
end

# O(n) speed
def highest_product2(list)
  raise "Need at least three" unless list.count > 2

  # Need to track highest and lowest product in case of negative numbers
  highest_product_of_two = lowest_product_of_two = list[0..1].reduce(:*)

  # In order to keep track of lowest product, we will need two know numbers
  lowest  = list[0..1].min
  highest = list[0..1].max
  max_product = highest_product_of_two * list[2]
  list[2..-1].each do |current|
    max_product = [max_product, current * highest_product_of_two, current * lowest_product_of_two].max
    highest_product_of_two = [highest_product_of_two, current * highest, current * lowest].max
    lowest_product_of_two  = [lowest_product_of_two, current * highest, current * lowest].min
    highest = [highest, current].max
    lowest  = [lowest, current].min
  end
  print "This takes into account negative numbers usering products of 2: "
  max_product
end

# O(n) speed
def highest_product3(list)
  raise "Need at least three" unless list.count > 2

  highest_two = lowest_two = list[0..1]

  # In order to keep track of lowest product, we will need two know numbers
  lowest  = list[0..1].min
  highest = list[0..1].max
  max_product = highest_two.reduce(:*) * list[2]
  list[2..-1].each do |current|
    max_product = [max_product, current * highest_two.reduce(:*), current * lowest_two.reduce(:*)].max

    highest_two << current
    highest_two.sort.shift

    lowest_two << current
    lowest_two.sort.pop

    highest = [highest, current].max
    lowest  = [lowest, current].min
  end
  print "This takes into account negative numbers tracking numbers themselves: "
  max_product
end

if $0 == __FILE__
  list = [-3, 4, -1, -7, 3, 2]
  puts "[#{list.join(', ')}]"
  puts "#{highest_product1(list)}"
  puts "#{highest_product2(list)}"
  puts "#{highest_product3(list)}"
end

# PROBLEM: You have an array of integers, and for each index you want to find
# the product of every integer except the integer at that index.
#
# DESCRIPTION:
# Write a function get_products_of_all_ints_except_at_index() that takes an
# array of integers and returns an array of the products. NOTE: Do not use
# division in your solution.
#
# [1, 7, 3, 4] #=> [84, 12, 28, 21]

# Following solution is O(2n) space and O(2n) time
def get_products_of_all_ints_except_at_index1(list)
    return [1] unless list.count > 1

    products = Array.new(list.count) # This is faster to create array of exact size

    (0..list.count-1).each do |index|
        cloned_list = list.clone
        cloned_list.delete_at(index)
        products[index] = cloned_list.reduce(&:*)
    end
    products
end

# Following solution is faster but 0(2n) space.
#
# before:  [1, 7, 3, 4] #=> [1, 1, 1*7, 1*7*3] => [ 1,  1,  7, 21]
# after:   [1, 7, 3, 4] #=> [7*3*4, 3*4, 4, 1] => [84, 12,  4,  1]
# product: [1, 7, 3, 4] #=>                       [84, 12, 28, 21]
def get_products_of_all_ints_except_at_index2(list)
    products_before = Array.new(list.count)
    products_after  = Array.new(list.count)
    current_before_product = 1
    current_after_product = 1
    (0..list.count-1).each do |index|
      products_before[index]  = current_before_product
      current_before_product *= list[index]
      products_after[list.count-1-index] = current_after_product
      current_after_product *= list[list.count-1-index]
    end

    products = []
    (0..list.count-1).each do |index|
      products << products_before[index] * products_after[index]
    end
    products
end

# Following solution is O(2n) space and O(n) time
def get_products_of_all_ints_except_at_index3(list)
    products = Array.new(list.count)
    current_product = 1
    max_index = list.count-1
    (0..max_index).each do |index|
      products[index]  = current_product
      current_product *= list[index]
    end

    current_product = 1
    (0..max_index).each do |index|
      products[max_index-index] *= current_product
      current_product *= list[max_index-index]
    end
    products
end



if $0 == __FILE__
  list = [1, 7, 3, 4]
  puts "[#{list.join(', ')}]"
  puts "O(2n) space slower [#{get_products_of_all_ints_except_at_index1(list).join(', ')}]"
  puts "O(2n) space [#{get_products_of_all_ints_except_at_index2(list).join(', ')}]"
  puts "O(n) [#{get_products_of_all_ints_except_at_index3(list).join(', ')}]"
end

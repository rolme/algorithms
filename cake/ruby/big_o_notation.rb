# O(1) or constant time
def print_first_item(items)
  puts items[0]
end

# O(n) or linear time
def print_all_items(items)
  items.each do |item|
    puts item
  end
end

# O(n^2) or quadratic time
def print_all_possible_ordered_pairs(items)
  items.each do |first_item|
    items.each do |second_item|
      puts first_item, second_item
    end
  end
end

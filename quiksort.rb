# simple quick sort
def quicksort(args)
  list = args[:list].clone
  return list if list.length <= 1
  
  pivot = rand(list.size)
  pivot_value = list.delete_at(pivot)
  less = Array.new
  more = Array.new
  list.each do |x|
    if x <= pivot_value
      less.push x
    else
      more.push x
    end
  end
  return  quicksort(list: less) + [pivot_value] + quicksort(list: more)
end

if $0 == __FILE__
  puts "QUICKSORT - SIMPLE"
  unsorted = (0..99).to_a.sample(20)
  puts "unsorted: #{unsorted}"
  sorted = quicksort(list: unsorted)
  puts "sorted:   #{sorted}"
end


class Array
  def swap!(a,b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

def partition (args)
  list = args[:list]
  left = args[:left]
  right = args[:right]
  pivot = args[:pivot]
  
  pivot_value = list[pivot]
  list.swap!(pivot, right)
  index = left
  
  for i in left..right-1 do
    if list[i] < pivot_value
      list.swap!(i, index)
      index += 1
    end
  end
  list.swap!(index, right)
  return index
end

# inline quick sort
def quicksort(args)
  list = args[:list]
  left = args[:left]
  right = args[:right]
  
  if left < right
    pivot = rand(left..right)
    new_pivot = partition(list: list, left: left, right: right, pivot: pivot)
    quicksort(list: list, left: left, right: new_pivot - 1)
    quicksort(list: list, left: new_pivot + 1, right: right)
  end
  list
end

if $0 == __FILE__
  puts "QUICKSORT - IN LINE"
  puts "unsorted: #{unsorted}"
  sorted = quicksort(list: unsorted, left: 0, right: unsorted.size - 1)
  puts "sorted:   #{sorted}"
end



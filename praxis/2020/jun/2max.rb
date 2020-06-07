def sum_number(n)
  total = 0
  n.to_s.split("").each do |c|
    total += c.to_i
  end
  total
end

def lookup_max_list(number_array)
  lookup_list = {}
  number_array.each do |n|
    sum = sum_number(n)
    if lookup_list[sum].nil?
      lookup_list[sum] = [n]
    elsif lookup_list[sum][1].nil? || n > lookup_list[sum][1]
      lookup_list[sum][1] = n
    end
  end

  lookup_list
end

list = [51, 71, 17, 26, 12, 42]
lookup_max_list(list).map do |key, values|
  total = (values.length === 2) ? values.sum() : -1
  puts "#{key}: #{total} [#{values.join(', ')}]"
end
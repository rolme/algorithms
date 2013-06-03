require 'benchmark'

# When finding the mode of an Array, its best to use:
#
#  #group_by  # Using ruby 2.0.0
#
class Array
  def grep_mode
    sort_by {|i| grep(i).length }.last
  end

  def inject_mode
    freq = inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    max = freq.values.max
    freq.select { |k, f| f == max }.map(&:first)
  end

  def group_by_mode
    group_by {|x| x}.          #=> Group the values
      group_by {|k,v| v.size}. #=> Group the key, values
      sort.                    #=> Sort the kv pairs
      last.                    #=> Get the highest size-group
      last.                    #=> Get the highest values
      map(&:first)             #=> Return the values
  end
end

list = Array.new(1_000) { |i| rand(1..50) }

Benchmark.bm(15) do |b|
  response = {}

  %w[grep_mode inject_mode group_by_mode].each do |mode|
    b.report(mode) do
      100.times do
        response[mode] = list.send(mode).inspect
      end
    end
  end

  response.each { |mode, value| puts "%15s #=> %s" % [mode, value] }

end
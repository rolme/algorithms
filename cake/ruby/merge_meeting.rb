# PROBLEM: Your company built an in-house calendar tool called HiCal. You want
# to add a feature to see the times in a day when everyone is available.
#
# DESCRIPTION:
# To do this, you’ll need to know when any team is having a meeting. In HiCal,
# a meeting is stored as a tuple of integers (start_time, end_time) . These
# integers represent the number of 30-minute blocks past 9:00am.
#
# [(0, 1), (3, 5), (4, 8), (10, 12), (9, 10)] #=> [(0, 1), (3, 8), (9, 12)]

# O(n log n) speed but does not take into account - numbers
def merge_meetings(meetings)

  # We need to sort incase meetings starting earlier come later.
  # This costs O(n log n) but allows us to pass array once.
  sorted_meetings = Marshal.load(Marshal.dump(meetings.sort { |a,b| a[0] <=> b[0] }))

  merged_meetings = [sorted_meetings[0]]
  sorted_meetings[1..-1].each do |meeting|
    if merged_meetings[-1][1] >= meeting[0]
      merged_meetings[-1][1] = [merged_meetings[-1][1], meeting[1]].max
    else
      merged_meetings << meeting
    end
  end
  merged_meetings.each do |block|
    print "(#{block[0]}, #{block[1]}) "
  end
  puts ""
end

if $0 == __FILE__
  meetings = [[0, 1], [3, 8], [4, 7], [10, 12], [9, 10]]
  meetings.each do |block|
    print "(#{block[0]}, #{block[1]}) "
  end
  puts ""
  puts "#{merge_meetings(meetings)}"
end

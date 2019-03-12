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
def condense_meeting_times1(list)

  # We need to sort incase meetings starting earlier come later.
  # This costs O(n log n) but allows us to pass array once.
  list = list.sort{ |a,b| a[0] <=> b[0] }

  condensed_list = [list[0]]
  list[1..-1].each do |meeting|
    if condensed_list[-1][1] >= meeting[0]
      condensed_list[-1][1] = meeting[1]

      # Following code is not needed because we sorted.
      # if meeting[1] > condensed_list[-1][1]
      #   condensed_list[-1][1] = meeting[1]
      # end

      # if meeting[0] < condensed_list[-1][0]
      #   condensed_list[-1][0] = meeting[0]
      # end
    else
      condensed_list << meeting
    end
  end
  condensed_list.each do |block|
    print "(#{block[0]}, #{block[1]}) "
  end
  puts ""
end

if $0 == __FILE__
  list = [[3, 5], [4, 8], [0, 1], [10, 12], [9, 10]]
  list.each do |block|
    print "(#{block[0]}, #{block[1]}) "
  end
  puts ""
  puts "#{condense_meeting_times1(list)}"
end

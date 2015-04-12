# PROBLEM: A crack team of love scientists from OkEros (a hot new dating site)
# have devised a way to represent dating profiles as rectangles on a
# two-dimensional plane.
#
# DESCRIPTION:
# They need help writing an algorithm to find the intersection of two users'
# love rectangles. They suspect finding that intersection is the key to a
# matching algorithm so powerful it will cause an immediate acquisition by
# Google or Facebook or Obama or something.
#
# Write a function to find the rectangular intersection of two given love
# rectangles.
#
# Love rectangles are defined as hash maps like this:
#
#   my_rectangle = {
#
#     # coordinates of bottom-left corner:
#     'x': 1,
#     'y': 5,
#
#     # width and height
#     'width': 10,
#     'height': 4
#   }
#
# Your output rectangle should use this format as well.

def overlap_rectangle1(rect1, rect2)
  def overlap_range(point1, length1, point2, length2)
    starting_point = [point1, point2].max
    ending_point   = [point1 + length1, point2 + length2].min

    return [nil, nil] if starting_point >= ending_point

    overlap_width = ending_point - starting_point
    return[starting_point, overlap_width]
  end

  x_point, x_width  = overlap_range(rect1[:x], rect1[:w], rect2[:x], rect2[:w])
  y_point, y_height = overlap_range(rect1[:y], rect1[:h], rect2[:y], rect2[:h])
  if x_width.nil? || y_height.nil?
    "None"
  else
    {x: x_point, y: y_point, width: x_width, height: y_height }
  end
end

if $0 == __FILE__
  rect1 = { x: 1, y: 3, w: 5, h: 6 }
  rect2 = { x: 2, y: 1, w: 5, h: 6 }

  puts "rect1: #{rect1}"
  puts "rect2: #{rect2}"
  puts "overlap: #{overlap_rectangle1(rect1, rect2)}"
end

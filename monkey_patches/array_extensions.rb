class Array

  # Public: Get the mode of a given Array.
  #
  # Group by values, then group by [key, values], then sort the [key, value]
  # pair, then get the highest size-group, then get the highest values, and
  # return the values
  #
  # Examples
  #   [1,2,2,3,1,2].mode #=> [2]
  #   [1,2,3,3,1,2].mode #=> [1,2,3]
  #   [1,2,1,2,1,2].mode #=> [1,2]
  #
  # Returns an Array.
  def mode
    group_by {|x| x}.          #=> Group the values
      group_by {|k,v| v.size}. #=> Group the key, values
      sort.                    #=> Sort the kv pairs
      last.                    #=> Get the highest size-group
      last.                    #=> Get the highest values
      map(&:first)             #=> Return the values
  end
end

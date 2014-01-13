# Performance:      O(n/2)
# Space complexity: O(n)
class Reverse
  def initialize(str)
    @str_list = str.split('')
  end

  def reverse
    tmp = ''
    back  = @str_list.length - 1
    front = 0
    while front < back
      tmp              = @str_list[front]
      @str_list[front] = @str_list[back]
      @str_list[back]  = tmp
      front += 1
      back -= 1
    end
    @str_list.join('')
  end
end

if $0 == __FILE__
  puts "Lets reverse the following strings."
  %w{
    testimony
    guilty
    unique
  }.each do |word|
    puts "'#{word}' reversed (Array):          #{Reverse.new(word).reverse}"
    puts "'#{word}' reversed (String#reverse): #{word.reverse}"
  end
end

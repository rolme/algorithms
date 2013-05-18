# check if string has all unique characters

class String
  def is_unique?
    chars = self.chars
    chars.uniq.size == chars.size
  end
end

if $0 == __FILE__
  puts "Determine if a string has all unique characters"
  puts
  %w{
    testimony
    guilty
    unique
  }.each do |word|
    puts "'#{word}' unique characters: #{word.is_unique?}"
  end
end

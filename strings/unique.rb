# Performance      - O(n)
# Space complexity - O(n)
# Requires additional data structure (Hash)
class UniqueHash
  attr_reader :list

  def initialize(str)
    @list = str.split('')
  end

  def is_unique?
    return true if @list.length < 2

    hash = {}
    @list.each do |c|
      return false if hash[c]
      hash[c] = 1
    end
    true
  end
end

# Performance      - O(n)
# Space complexity - O(1)
# Assumes ACSII set with 256 characters
class UniqueArray
  MAX_CHARS = 256

  attr_reader :str_list

  def initialize(str)
    @str_list = str.split('')
    @list     = Array.new(MAX_CHARS, false)
  end

  def is_unique?
    return false if str_list.length > MAX_CHARS

    str_list.each do |c|
      return false if @list[c.ord]
      @list[c.ord] = true
    end
    true
  end
end

class String
  def is_unique?
    chars = self.chars
    chars.uniq.size == chars.size
  end
end

if $0 == __FILE__
  puts "Determine if a string has all unique characters"
  %w{
    testimony
    guilty
    unique
  }.each do |word|
    puts "'#{word}' unique characters (Hash) :       #{UniqueHash.new(word).is_unique?}"
    puts "'#{word}' unique characters (Array):       #{UniqueArray.new(word).is_unique?}"
    puts "'#{word}' unique characters (String#uniq): #{word.is_unique?}"
  end
end

class Permutation
  def initialize(str)
    @str_list = str.split('')
  end

  # performance      O(n^2)
  # space complexity O(log n)
  # Bad solution as I am looking for every permutation.
  def is_permutation_of?(word)
    permutations.include? word
  end

  def permutations
    return @_permutations if @_permutations

    list = @str_list
    @_permutations = list.count < 2 ? list : permutate(list).collect(&:join)
  end

private

  def permutate(list)
    return [[list[0],list[1]], [list[1],list[0]]] if list.length == 2

    item = list.slice!(0)
    perms = permutate(list)
    return add_permutations perms, item
  end

  def add_permutations(list, c)
    new_list = []
    list.each do |p|
      length = p.length
      while length >= 0
        copy = p.clone
        new_list << copy.insert(length, c)
        length -= 1
      end
    end
    new_list
  end
end

# check if a given string is a permutation of another. Or in other words
# an anagram of each other.
class String
  # performance      - O(n)
  # space complexity - O(n)
  # Best solution as a permutation will have the same # of sorted characters
  def is_permutation_of?(permutation)
    return false if self.size != permutation.size
    self.chars.sort == permutation.chars.sort
  end

  def permutations
    chars = self.chars
    permutations_list = chars.permutation
    permutations_list.collect(&:join)
  end

  # performance      - O(n)
  # space complexity - O(n)
  # Ignore case and spaces.
  def is_anagram_of?(anagram)
    self_frequency    = self.downcase.delete(' ').character_frequency
    anagram_frequency = anagram.downcase.delete(' ').character_frequency
    self_frequency.eql? anagram_frequency
  end

  def character_frequency
    chars = self.chars
    chars.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  end
end

if $0 == __FILE__
  word = 'mat'
  puts "Check following words are a permutation of '#{word}'"
  puts "permutations of [#{word}]: #{word.permutations.count}: #{word.permutations.join(', ')}"
  puts "permutations of [#{word}]: #{Permutation.new(word).permutations.count}: #{Permutation.new(word).permutations.join(', ')}"
  puts
  ['atm', 'mAt', 'a tm', 'tam'].each do |permutation|
    puts "'#{permutation}' permutation of [#{word}] (Permutation): #{Permutation.new(word).is_permutation_of? permutation}"
    puts "'#{permutation}' permutation of [#{word}] (String#permutation): #{word.is_permutation_of? permutation}"
    puts "'#{permutation}' anagram of [#{word}]: #{word.is_anagram_of? permutation}"
    puts
  end
end

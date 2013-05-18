# check if a given string is a permutation of another. Or in other words
# an anagram of each other.
class String
  def to_a
    self.split(//)
  end

  def is_permutation_of?(permutation)
    permutation_list = self.permutations
    permutation_list.include? permutation
  end

  def permutations
    self_as_array = self.to_a
    permutations_list = self_as_array.permutation
    permutations_list.map{ |p| p.join }
  end

  def is_anagram_of?(anagram)
    self_frequency    = self.character_frequency
    anagram_frequency = anagram.character_frequency
    self_frequency.eql? anagram_frequency
  end

  def character_frequency
    self_as_array = self.to_a
    self_as_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  end
end

if $0 == __FILE__
  word = 'mat'
  puts "Check following words are a permutation of '#{word}'"
  puts
  %w{
    atm
    mat
    mtm
    tam
  }.each do |permutation|
    puts "'#{permutation}' permutation of [#{word}]: #{word.is_permutation_of? permutation}"
    puts "'#{permutation}' anagram of [#{word}]: #{word.is_anagram_of? permutation}"
  end
end

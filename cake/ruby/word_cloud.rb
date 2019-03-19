# class WordCloudData
#   attr_reader :words_to_counts
#
#   def initialize(input_string)
#     # Count the frequency of each word
#     @words_to_counts = {}
#     words = input_string.gsub(/[\p{P}&&[^'-.]]/, '').split(/\.+|\s/)
#     words.each do |word|
#       next if word !~ /[a-z]/i
#
#       @words_to_counts[word] ||= 0
#       @words_to_counts[word] += 1
#     end
#   end
# end
class WordCloudData
  attr_reader :words_to_counts

  def initialize(string)
    @words_to_counts = {}
    populate_words_to_counts(string)
  end

  def populate_words_to_counts(string)
    word_start_index = 0
    word_length = 0

    string.each_char.with_index do |c, i|
      if i == string.length-1
        if c =~ /[a-z]/i
          word_length += 1
        end
        if word_length > 0
          word = string.slice(word_start_index, word_length)
          add_word_to_hash(word)
        end

      elsif c =~ /\s|\u2014/
        if word_length > 0
          word = string.slice(word_start_index, word_length)
          add_word_to_hash(word)
          word_length = 0
        end

      elsif c == '.'
        if word_length > 0
          word = string.slice(word_start_index, word_length)
          add_word_to_hash(word)
          word_length = 0
        end

      elsif c =~ /[a-z\']/i
        if word_length == 0
          word_start_index = i
        end
        word_length += 1

      elsif c == '-'
        if i > 0 && string[i-1] =~ /[a-z]/i && string[i+1] =~ /[a-z]/i
          word_length += 1
        elsif word_length > 0
          word = string.slice(word_start_index, word_length)
          add_word_to_hash(word)
          word_length = 0
        end
      end
    end
  end

  def add_word_to_hash(word)
    if @words_to_counts.include? word
      @words_to_counts[word] += 1

    elsif @words_to_counts.include? word.downcase
      @words_to_counts[word.downcase] += 1

    elsif @words_to_counts.include? word.capitalize
      @words_to_counts[word]  = 1
      @words_to_counts[word] += @words_to_counts[word.capitalize]
      @words_to_counts.delete(word.capitalize)

    else
      @words_to_counts[word] = 1
    end
  end
end


def run_tests
  desc = 'simple sentence'
  input = 'I like cake'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'I' => 1, 'like' => 1, 'cake' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'longer sentence'
  input = 'Chocolate cake for dinner and pound cake for dessert'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {
    'and' => 1,
    'pound' => 1,
    'for' => 2,
    'dessert' => 1,
    'Chocolate' => 1,
    'dinner' => 1,
    'cake' => 2,
  }
  assert_equal(actual, expected, desc)

  desc = 'punctuation'
  input = 'Strawberry short cake? Yum!'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'cake' => 1, 'Strawberry' => 1, 'short' => 1, 'Yum' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'hyphenated words'
  input = 'Dessert - mille-feuille cake'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'cake' => 1, 'Dessert' => 1, 'mille-feuille' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'ellipses between words'
  input = 'Mmm...mmm...decisions...decisions'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'mmm' => 2, 'decisions' => 2 }
  assert_equal(actual, expected, desc)

  desc = 'apostrophes'
  input = "Allie's Bakery: Sasha's Cakes"

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'Bakery' => 1, 'Cakes' => 1, "Allie's" => 1, "Sasha's" => 1 }
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests

# Given a string, compression it based on repeated characters.  If the
# compression is longer, return the original string instead.
#
# NOTES:
#   Avoid using String + String as this creates a new String
#   Avoid "#{String}#{String}" as this is slow as well
#   Use String << String to append to a String
#   More information here: goo.gl/fPTmy
class String
  def compress(type=:repeated_characters)
    self.send(type)
  end

private

  def repeated_characters
    return self if self.send(:_repeated_characters_size) >= self.size

    compressed = ''
    count = 0
    previous = self.chr
    self.chars.each do |chr|
      if previous == chr
        count += 1
      else
        compressed << previous << count.to_s
        previous = chr
        count = 1
      end
    end
    compressed << previous << count.to_s
  end

  def _repeated_characters_size
    return self.size if self.size <= 1

    size  = 0
    count = 0
    previous = self.chr
    self.chars.each do |chr|
      if previous == chr
        count += 1
      else
        size += 1 + count.to_s.size
        previous = chr
        count = 1
      end
    end
    size += 1 + count.to_s.size
  end
end

if $0 == __FILE__
  puts "Compress the follwing strings:"
  puts
  %w{
    aa
    aaa
    abb
    ab
    testimony
    coding
    boo
    aabcdddddabbbdd
    google
  }.each do |word|
    puts "'#{word}' compressed to: #{word.compress}"
  end
end

# Given a string, compress it based on repeated characters.  If the
# compression is longer, return the original string instead.
#
# Performance O(n)
# Storage Complexity O(n)
#
# NOTES:
#   Avoid using String + String as this creates a new String
#   Avoid "#{String}#{String}" as this is slow as well
#   Use String << String to append to a String
#   More information here: goo.gl/fPTmy
class String
  def compress
    return self if self.send(:_compressSize) >= self.size  # Prevent storage to be bigger than N

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

private

  def compressSize
    return self.size if self.size <= 1

    size = count = 0
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
    aaa
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

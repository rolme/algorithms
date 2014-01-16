class Matrix
  attr_accessor :matrix
  attr_reader :size

  def initialize(size)
    @size   = size
    @matrix = generate_matrix
  end

  def rotate
    (size/2).times do |layer|
      first = layer
      last  = size - 1 - layer
      (first..last - 1).each do |i|
        offset = i - first
        top = matrix[first][i]

        matrix[first][i]           = matrix[last-offset][first]
        matrix[last-offset][first] = matrix[last][last-offset]
        matrix[last][last-offset]  = matrix[i][last]
        matrix[i][last]            = top
      end
    end
  end

  def to_s
    matrix.each do |row|
      row.each do |cell|
        print "%02d " % cell
      end
      puts
    end
  end

private

  def generate_matrix
    row   = 0
    count = 0
    Array.new(size) do
      count  = (row * size - 1)
      row   += 1
      Array.new(size) { count += 1 }
    end
  end

end

if $0 == __FILE__
  matrix = Matrix.new(10)
  puts matrix
  matrix.rotate
  puts matrix
end
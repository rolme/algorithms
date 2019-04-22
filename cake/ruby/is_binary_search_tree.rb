def binary_search_tree?(root)

  # Determine if the tree is a valid binary search tree
  # 1. node's value is inbetween left and right
  # 2. node's right value is less than parent
  # 3. node's left value is less than right's value
  
  return true unless root

  nodes  = [[root, root.value, nil]]
  until nodes.empty?
    (node, parent_value, side) = nodes.pop

    next if node.left.nil? && node.right.nil?

    if node.left&.value && node.right&.value
      return false if !node.value.between?(node.left.value, node.right.value) || node.left.value > node.right.value
      return false if side == 'left' && node.right.value > parent_value
      return false if side == 'right' && node.left.value < parent_value
    elsif node.left&.value
      return false if node.value < node.left.value
      return false if side == 'right' && node.left.value < parent_value
    else
      return false if node.value > node.right.value
      return false if side == 'left' && node.right.value > parent_value
    end

    nodes << [node.left, node.value, 'left'] if node.left
    nodes << [node.right, node.value, 'right'] if node.right
  end
  true
end

# Tests

class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
  end
end

def run_tests
  desc = 'valid full tree'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  right.insert_left(60)
  right.insert_right(80)
  result = binary_search_tree?(tree)
  assert_true(result, desc)

  desc = 'both subtrees valid'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(80)
  left.insert_left(20)
  left.insert_right(60)
  right.insert_left(70)
  right.insert_right(90)
  result = binary_search_tree?(tree)
  assert_false(result, desc)

  desc = 'descending linked list'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(40)
  left_left = left.insert_left(30)
  left_left_left = left_left.insert_left(20)
  left_left_left.insert_left(10)
  result = binary_search_tree?(tree)
  assert_true(result, desc)

  desc = 'out of order linked list'
  tree = BinaryTreeNode.new(50)
  right = tree.insert_right(70)
  right_right = right.insert_right(60)
  right_right.insert_right(80)
  result = binary_search_tree?(tree)
  assert_false(result, desc)

  desc = 'one node tree'
  tree = BinaryTreeNode.new(50)
  result = binary_search_tree?(tree)
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
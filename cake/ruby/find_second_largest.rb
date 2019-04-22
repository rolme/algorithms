# Complexity
# We're doing one walk down our BST, which means O(h)O(h) time, where hh is the height of the tree (again, that's O(\lg{n})O(lgn) if the tree is balanced, O(n)O(n) otherwise). O(1)O(1) space.
def find_second_largest(root_node)
  raise "empty" if root_node.nil?
  raise "only one node" if !root_node.left && !root_node.right

  nodes = [[root_node, nil]]

  until nodes.empty?
    (node, parent_value) = nodes.pop
    return parent_value if !node.right && !node.left

    if node.right
      nodes << [node.right, node.value]
    elsif node.left && node.left.right
      nodes << [node.left.right, node.left.right.value]
    elsif node.left && !node.left.right
      return node.left.value
    end
  end
  nil
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
  desc = 'full tree'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  right.insert_left(60)
  right.insert_right(80)
  actual = find_second_largest(tree)
  expected = 70
  assert_equal(actual, expected, desc)

  desc = 'largest has a left child'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  right.insert_left(60)
  actual = find_second_largest(tree)
  expected = 60
  assert_equal(actual, expected, desc)

  desc = 'largest has a left subtree'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  right_left = right.insert_left(60)
  right_left_left = right_left.insert_left(55)
  right_left.insert_right(65)
  right_left_left.insert_right(58)
  actual = find_second_largest(tree)
  expected = 65
  assert_equal(actual, expected, desc)

  desc = 'second largest is root node'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  actual = find_second_largest(tree)
  expected = 50
  assert_equal(actual, expected, desc)

  desc = 'descending linked list'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(40)
  left_left = left.insert_left(30)
  left_left_left = left_left.insert_left(20)
  left_left_left.insert_left(10)
  actual = find_second_largest(tree)
  expected = 40
  assert_equal(actual, expected, desc)

  desc = 'ascending linked list'
  tree = BinaryTreeNode.new(50)
  right = tree.insert_right(60)
  right_right = right.insert_right(70)
  right_right.insert_right(80)
  actual = find_second_largest(tree)
  expected = 70
  assert_equal(actual, expected, desc)

  desc = 'error when tree has one node'
  tree = BinaryTreeNode.new(50)
  assert_raises(desc) { find_second_largest(tree) }

  desc = 'error when tree is empty'
  assert_raises(desc) { find_second_largest(nil) }
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

def assert_raises(desc)
  begin
    yield
    puts "#{desc} ... FAIL"
  rescue
    puts "#{desc} ... PASS"
  end
end

run_tests
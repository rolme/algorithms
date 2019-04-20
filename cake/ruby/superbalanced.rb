# Recursive approach but not greedy
# def balanced?(tree_root)
#   return true if tree_root.left.nil? && tree_root.right.nil?
#   (shortest_depth, longest_depth) = [nil, nil]

#   (shortest_depth, longest_depth) = depth(tree_root.left, 1, shortest_depth, longest_depth) if !!tree_root.left
#   (shortest_depth, longest_depth) = depth(tree_root.right, 1, shortest_depth, longest_depth)  if !!tree_root.right
#   (longest_depth - shortest_depth) <= 1
# end

# def depth(node, level, shortest_depth, longest_depth)
#   # Found a leaf node
#   if node.left.nil? && node.right.nil?
#     shortest_depth = level if shortest_depth.nil? || level < shortest_depth
#     longest_depth = level if longest_depth.nil? || level > longest_depth
#     return [shortest_depth, longest_depth]
#   end

#   (shortest_depth, longest_depth) = depth(node.left, level+1, shortest_depth, longest_depth) if !!node.left
#   (shortest_depth, longest_depth) = depth(node.right, level+1, shortest_depth, longest_depth) if !!node.right
#   [shortest_depth, longest_depth]
# end

def balanced?(tree_root)
  return true unless tree_root

  depths = []  # we short-circuit as soon as we find more than 2

  # we'll treat this array as a stack that will store pairs [node, depth]
  nodes = []
  nodes << [tree_root, 0]

  until nodes.empty?
    # pop a node and its depth from the top of our stack
    node, depth = nodes.pop

    # case: we found a leaf
    if !node.left && !node.right

      # we only care if it's a new depth
      unless depths.include?(depth)
        depths.push(depth)

        # two ways we might now have an unbalanced tree:
        #   1) more than 2 different leaf depths
        #   2) 2 leaf depths that are more than 1 apart
        if depths.length > 2 ||
           depths.length == 2 && (depths[0] - depths[1]).abs > 1
          return false
        end
      end

    # case: this isn't a leaf - keep stepping down
    else
      nodes << [node.left, depth + 1] if node.left
      nodes << [node.right, depth + 1] if node.right
    end
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
  desc = 'full tree'
  tree = BinaryTreeNode.new(5)
  left = tree.insert_left(8)
  right = tree.insert_right(6)
  left.insert_left(1)
  left.insert_right(2)
  right.insert_left(3)
  right.insert_right(4)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'both leaves at the same depth'
  tree = BinaryTreeNode.new(3)
  left = tree.insert_left(4)
  right = tree.insert_right(2)
  left.insert_left(1)
  right.insert_right(9)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'leaf heights differ by one'
  tree = BinaryTreeNode.new(6)
  left = tree.insert_left(1)
  right = tree.insert_right(0)
  right.insert_right(7)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'leaf heights differ by two'
  tree = BinaryTreeNode.new(6)
  left = tree.insert_left(1)
  right = tree.insert_right(0)
  right_right = right.insert_right(7)
  right_right.insert_right(8)
  result = balanced?(tree)
  assert_false(result, desc)

  desc = 'three leaves total'
  tree = BinaryTreeNode.new(1)
  left = tree.insert_left(5)
  right = tree.insert_right(9)
  right.insert_left(8)
  right.insert_right(5)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'both subtrees superbalanced'
  tree = BinaryTreeNode.new(1)
  left = tree.insert_left(5)
  right = tree.insert_right(9)
  right_left = right.insert_left(8)
  right.insert_right(5)
  right_left.insert_left(7)
  result = balanced?(tree)
  assert_false(result, desc)

  desc = 'only one node'
  tree = BinaryTreeNode.new(1)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'linked list tree'
  tree = BinaryTreeNode.new(1)
  right = tree.insert_right(2)
  right_right = right.insert_right(3)
  right_right.insert_right(4)
  result = balanced?(tree)
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
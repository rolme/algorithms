class Node
  attr_accessor :left, :right, :value

  def initialize(value=nil, left=nil, right=nil)
    @value, @left, @right = value, left, right
  end
end

def insert(node, value, &block)
  return Node.new(value) unless node

  if block[value, node.value] < 0
    node.left = insert(node.left, value, &block)
  else
    node.right = insert(node.right, value, &block)
  end
  return node
end

def traverse(node, order=:preorder, &block)
  return false unless node

  case order
  when :preorder
    yield node.value
    traverse(node.left, order, &block)
    traverse(node.right, order, &block)
  when :inorder
    traverse(node.left, order, &block)
    yield node.value
    traverse(node.right, order, &block)
  when :postorder
    traverse(node.left, order, &block)
    traverse(node.right, order, &block)
    yield node.value
  end
end

if $0 == __FILE__
  root = nil
  # "chunkybacon".scan(/./m) { |c| root = insert(root, c) {|a,b| a <=> b } }
  "chunkybacon".scan(/./m) do |c|
    root = insert(root, c) {|a,b| a <=> b }
  end
  print "pre order:  "
  traverse(root) { |n| print n }
  print "\nin order:   "
  traverse(root, :inorder) { |n| print n }
  print "\npost order: "
  traverse(root, :postorder) { |n| print n }
end
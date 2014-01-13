class Node
  attr_accessor :left, :right, :value

  def initialize(value=nil, left=nil, right=nil)
    @value, @left, @right = value, left, right
  end
end

class BinarySearchTree
  attr_reader :root

  def initialize(str)
    str.scan(/./m) { |c| @root = insert(@root, c) {|a,b| a <=> b } }
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

  def traverse(node=root, order=:inorder, &block)
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

  def find(value)
    node = root
    while node
      if value < node.value
        node = node.left
      elsif value > node.value
        node = node.right
      elsif node.value == value
        return node
      end
    end
  end
end

if $0 == __FILE__
  tree = BinarySearchTree.new "chunkybacon"
  print "pre order:  "
  tree.traverse(tree.root, :preorder) { |n| print n }
  print "\nin order:   "
  tree.traverse { |n| print n }
  print "\npost order: "
  tree.traverse(tree.root, :postorder) { |n| print n }
  print "\nfind k:     "
  tree.find('k') && puts(tree.find('k').value)
end
# 4.6 Successor
# Write an algorithm to find the "next" node (i.e., in-order successor) of a
#   given node in a binary search tree. You may assume that each node has a
#   link to its parent.
#

# Discussion:
#   - If the current node has a right-child, the in-order successor is the
#     leftmost node in the right subtree
#   - Otherwise, inspect ancestors until an ancestor is a left-child of its
#     parent
#   - Otherwise, there is no in-order successor
#
# Time complexity: O(n) in the case that there is no successor, and the given
#   node is the right-most node in the tree
# Space complexity: O(1) - no added space is used
#

# Monkey-patch Tree::Node to add the parent reference
module Util
  class Tree
    class Node
      attr_accessor :parent
    end
  end
end

def successor(node)
  if !node.right.nil?
    # Node has a right child; find the leftmost value in the right subtree
    explore_downwards(node.right)
  else
    # Check node's parents for an ancestor that's a left-child
    explore_upwards(node)
  end
end

# Finds leftmost child of a tree
def explore_downwards(node)
  node = node.left until node.left.nil?
  node.data
end

# Finds the nearest ancestor with a left-child in the ancestor chain
def explore_upwards(node)
  node = node.parent until node.parent.nil? || node.parent.left == node
  node.parent.nil? ? nil : node.parent.data
end

# 4.4 Check Balanced
# Implement a function to check if a binary tree is balanced. For the purposes
#   of this question, a balanced tree is defined to be a tree such that the
#   heights of the two subtrees of any node dever differ by more than one.
#

# Discussion:
#   This is another problem that can be solved with a DFS. Once a leaf node is
#   encountered, the depth can be bubbled back up to provide comparison between
#   left and right nodes.
#

def check_balanced(node)
  # Check height can return a depth of 0 when the root node is a leaf, so
  #   explicitly check for false values
  check_height(node) != false
end

def check_height(node, depth = 0)
  # Return the current depth if this is a leaf node
  return depth if node.left.nil? && node.right.nil?

  # Height is current depth if nil, otherwise recurse
  left_depth = node.left.nil? ? depth : check_height(node.left, depth + 1)
  # Bubble up when recursion detects an imbalance
  return false if left_depth == false

  # Height is current depth if nil, otherwise recurse
  right_depth = node.right.nil? ? depth : check_height(node.right, depth + 1)
  # Bubble up when recursion detects an imbalance
  return false if right_depth == false

  # Return false if there's an imbalance between left and right subtrees
  return false if (left_depth - right_depth).abs > 1

  # Return the max depth of this subtree
  return [left_depth, right_depth].max
end

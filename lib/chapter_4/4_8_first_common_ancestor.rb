# 4.7 First Common Ancestor
# Design an algorithm and write code to find the first common ancestor of two
#   nodes in a binary tree. Avoid storing additional nodes in a data structure.
#   NOTE: This is not necessarily a BST
#
# Discussion:
#   We can do a DFS on the tree where we check that the current node's value
#   is in the set we're searching for.
#

def first_common_ancestor(node, value1, value2)
  result = fca_search(node, [value1, value2])
  result.is_a?(Tree::Node) ? result.data : false
end

def fca_search(node, values)
  mid = values.include?(node.data) ? 1 : 0

  left = node.left.nil? ? 0 : fca_search(node.left, values)
  return left if left.is_a?(Tree::Node)

  right = node.right.nil? ? 0 : fca_search(node.right, values)
  return right if right.is_a?(Tree::Node)

  sum = mid + left + right
  sum >= 2 ? node : sum
end

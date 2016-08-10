# 4.2 Minimal Tree
# Given a sorted (increasing order) array with unique integer elements, write an
#   algorithm to create a binary search tree with minimal height.
#

# Discussion:
#   "Minimal height" implies that the BST is balanced, so we should consider
#   placing the median value at the root. This must occur at each branch, so
#   it also implies a recursive algorithm.
#

# On each recursive step, this implementation splits the given array into three
#   parts: the middle value, the remaining left tree, and the remaining right
#   tree. The middle value becomes the root node of the current tree, and the
#   other parts are assigned to the node's left and right trees.
#
def to_bst(array)
  mid_index = array.length / 2
  # Create node from middle value
  node = Tree::Node.new(array[mid_index])
  if array.length > 1
    left_array = array[0..mid_index - 1]
    right_array = array[mid_index + 1..array.length - 1]

    # Create subtrees
    node.left = to_bst(left_array) if left_array.length > 0
    node.right = to_bst(right_array) if right_array.length > 0
  end
  node
end

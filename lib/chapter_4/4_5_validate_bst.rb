# 4.5 Validate BST
# Implement a function to check if a binary tree is a binary search tree.
#

# Discussion:
#   We can use a recursive function to check through the left/right subtrees of
#   a node while keeping track of the min/max allowable values for items in
#   those subtrees.
#

def validate_bst(node, min = nil, max = nil)
  # Check for root node being nil
  return false if node.nil?

  # Return false if this node is outside the range of valid values
  if (!min.nil? && node.data < min) || (!max.nil? && node.data > max)
    return false
  end

  # If child nodes are nil, this node is valid, otherwise validate subtrees
  #   and update the min/max
  left_valid = node.left.nil? ? true : validate_bst(node.left, min, node.data)
  right_valid = node.right.nil? ? true : validate_bst(node.right, node.data + 1, max)

  # If both children are valid, this node is valid
  left_valid && right_valid
end

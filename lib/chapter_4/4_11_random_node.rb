# 4.11 Random Node
# You are implementing a binary tree class from scratch which, in addition to
#   insert, find, and delete, has a method random_node() which returns a
#   random node from the tree. All nodes should be equally likely to be chosen.
#   Design and implement an algorithm for random_node and explain how you
#   would implement the rest of the methods
#
# Discussion
#   Say there are 10 nodes in the tree. This implies that each node should have
#   a 1/10 chance of being chosen. If we look at this recursively, the current
#   node should always have 1/(# nodes in current subtree) chance of being
#   chosen. Moving left or right should have a chance of (# nodes in left
#   subtree)/(# nodes in current subtree), and respectively for the right.
#

def random_node(node)
  left_count = count_nodes(node.left)
  right_count = count_nodes(node.right)

  # Pick a number that represents whether to choose the current value, move left
  #   or move right
  die_roll = rand(left_count + right_count + 1)
  result = if die_roll == 0
             result = node.data
           elsif die_roll <= left_count
             random_node(node.left)
           else
             random_node(node.right)
           end
  result
end

def count_nodes(node)
  return 0 if node.nil?
  count = 1
  count += count_nodes(node.left) unless node.left.nil?
  count += count_nodes(node.right) unless node.right.nil?
  count
end

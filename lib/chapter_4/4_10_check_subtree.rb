# 4.10 Check Subtree
# T1 and T2 are two very large binary trees, with T1 much bigger than T2. Create
#   an algorithm to determine if T2 is a subtree of T1. A tree T2 is a subtree
#   of T1 if there exists a node n in T1 such that the subtree of n is identical
#   to T2. That is, if you cut off the tree at node n, the two trees would be
#   identical
#

# This solution works by doing a DFS on T1. When a value matching T2's root is
#   encountered, it runs a separate recursive method to determine if the
#   subtrees match beginning at that node.
#
def check_subtree(t1, t2)
  return false if t1.nil?
  return true if t1.data == t2.data && compare_trees(t1, t2)
  check_subtree(t1.left, t2) || check_subtree(t1.right, t2)
end

def compare_trees(t1, t2)
  # Return false if only one of the two nodes are nil, or their data doesn't
  #   match
  return false if (t1.nil? ^ t2.nil?) || t1.data != t2.data

  # Check the subtrees down to leaf nodes
  left = (t1.left.nil? && t2.left.nil?) || compare_trees(t1.left, t2.left)
  right = (t1.right.nil? && t2.right.nil?) || compare_trees(t1.right, t2.right)
  left && right
end

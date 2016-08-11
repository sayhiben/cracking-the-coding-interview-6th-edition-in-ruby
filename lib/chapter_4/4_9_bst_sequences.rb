# 4.9 BST Sequences
# A binary search tree was created by traversing through an array from left to
#   right and inserting each element. Given a binary search tree with distinct
#   elements, print all possible arrays that could have led to this tree.
#
# Discussion:
#   - Roots must appear before their children
#   - Siblings and cousins may appear in any order
#

def bst_sequences(node)
  results = []

  # Nothing to do, return empty array
  if node.nil?
    results << []
    return results
  end

  # Recurse down to begin generating possible subsequences
  left = bst_sequences(node.left)
  right = bst_sequences(node.right)

  # Root nodes must come before children nodes, so save the prefix
  prefix = [node.data]

  # Each valid sequence of each child must be mixed with the other child
  left.each do |left_sequence|
    right.each do |right_sequence|
      results += mix_sequences(left_sequence, right_sequence, prefix)
    end
  end
  results
end

def mix_sequences(left, right, prefix)
  results = []

  # If either left or right is empty, there's nothing left to mix
  if left.empty? || right.empty?
    results << prefix + left + right
    return results
  end

  # Recurse into the left/right sequences by taking the first element and
  #   saving it to the prefix one at a time
  results += mix_sequences(left.drop(1), right, prefix + [left[0]])
  results += mix_sequences(left, right.drop(1), prefix + [right[0]])
  results
end

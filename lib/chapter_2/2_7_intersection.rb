# 2.7 Intersection
# Given two singly linked lists, determine if the two lists intersect. Return
#   the intersecting node. Note that the intersection is defined based on
#   reference, not value. That is, if the kth node of the first linked list is
#   the exact same node (by reference) as the jth node of the second linked
#   list, then they are intersecting.
#

# Observations:
#   - Linked lists intersect when their last elements are the same
#   - The intersecting node occurs at the same index when the lists are of the
#     same length
#

# This solution begins by "lining up" the cursors such that they each have the
#   same number of nodes remaining to explore. It then iterates through the
#   remaining nodes looking for a match.
#
# Time complexity: O(2*[node1.length,node2.length].max), as it must find the
#   length of each list, then iterate through it a second time looking for a
#   match
# Space complexity: O(1), as no extra space is used to store list data
#
def intersection(node1, node2)
  length1 = length(node1)
  length2 = length(node2)

  # Advance the cursor for the longer list until each cursor has the same number
  #   of nodes remaining
  (length1 - length2).times { node1 = node1.next } if length1 > length2
  (length2 - length1).times { node2 = node2.next } if length2 > length1

  # Iterate until we find a matching node
  until node1.nil?
    return node1 if node1 == node2
    node1 = node1.next
    node2 = node2.next
  end

  # return nil if no matching node is found
  nil
end

def length(node)
  i = 0
  until node.nil?
    i += 1
    node = node.next
  end
  i
end

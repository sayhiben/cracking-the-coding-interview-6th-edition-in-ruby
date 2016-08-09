# 2.3 Delete Middle Node
# Impleent an algoritm to delete a node in the middle (i.e., any node but the)
#   first and last node, not necessarily the exact middle) of a singly linked
#   list, given only access to that node.
#

# The given node cannot be properly deleted without breaking the link between
#   it and its previous node. Instead, we can copy the data from the subsequent
#   node to the given node, then delete the subsequent node.
#
# Time complexity: O(1)
# Space complexity: O(1)
#
def delete_middle_node(node)
  node.data = node.next.data
  node.next = node.next.next
end

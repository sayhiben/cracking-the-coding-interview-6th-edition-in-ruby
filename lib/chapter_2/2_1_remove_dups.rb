# 2.1 Remove Dups
# Write code to remove duplicates from an unsorted linked list
# Follow up: How can you solve this problem without a temporary buffer?
#

# Keeps track of seen values in a set. Removes nodes with values in the set.
#
# Time complexity: O(n), as it must inspect each node in the list
# Space complexity: O(n) extra space will be used in the Set if all characters
#   are unique
#
def remove_dups(node)
  return if node.nil? || node.next.nil?
  set = Set.new
  while !node.nil?
    set << node.data
    if !node.next.nil? && set.include?(node.next.data)
      node.next = node.next.next
    end
    node = node.next
  end
end

# For the follow up question, use two cursors and compare each node to each
#   subsequent node. This is more expensive in terms of time complexity, but
#   has the advantage that it uses O(1) extra space
#
# Time complexity: O(n^2)
# Space complexity: O(1)
#
def remove_dups_alt(node)
  return if node.nil? || node.next.nil?
  cursor = node
  while !cursor.nil?
    deletion_cursor = cursor
    while !deletion_cursor.nil?
      if !deletion_cursor.next.nil? && deletion_cursor.next.data == cursor.data
        deletion_cursor.next = deletion_cursor.next.next
      end
      deletion_cursor = deletion_cursor.next
    end
    cursor = cursor.next
  end
end

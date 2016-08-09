# 2.2 Return Kth to Last
# Implement an algorithm to find the kth to last element of a singly liked list.
#

# This pointer involves two cursors, one which advances k nodes ahead such that
#   once it reaches the last element, the second node will be k nodes behind.
#
# Time complexity: O(n), since it must iterate through the entire list to find
#   the end (and therefore k)
# Space complexity: O(1)
#
def kth_to_last(node, k)
  fast_cursor = node
  slow_cursor = node

  # Advance the fast_cursor so that slow_cursor always lags behind k nodes

  k.times { fast_cursor = fast_cursor.next }
  until fast_cursor.nil?
    fast_cursor = fast_cursor.next
    slow_cursor = slow_cursor.next
  end

  slow_cursor.data
end

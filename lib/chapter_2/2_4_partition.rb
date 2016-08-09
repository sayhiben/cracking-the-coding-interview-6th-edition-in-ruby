# 2.4 Partition
# Write code to parition a linked list around a value x, such that all nodes
#   less than x come before all nodes greater than or equal to x. If x is
#   contained within the list, the values of x only need to be after the
#   elements less than x. The partition element x can appear anywhere in the
#   "right partition"; it does not need to apear between the left and right
#   partitions.
#

# To satisfy the requirements, we only need to make sure that values less than
#   the partition value appear at the beginning of the list. This algorithm
#   iterates through the list and moves all values less than the partition
#   value to the beginning by replacing the head node.
#
# Time complexity: O(n), as it must iterate through the entire list
# Space complexity: O(1), as the extra references to nodes take constant space
#
def partition(head, partition_value)
  cursor = head
  until cursor.nil?
    if !cursor.next.nil? && cursor.next.data < partition_value
      # Save the node
      tmp = cursor.next

      # Delete it from the list
      cursor.next = cursor.next.next

      # Move it to the beginning of the list, and replace head
      tmp.next = head
      head = tmp
    else
      cursor = cursor.next
    end
  end
  head
end

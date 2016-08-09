# 2.6 Palindrome
# Implement a function to check if a linked list is a palindrome

# This iterative solution uses a ruby Array that it treats as a stack. It stores
#   the first half of the string in the stack, then compares the second half of
#   the string to the values on the stack.
#
# Time complexity: O(n), as it must look at each item in the list
# Space complexity: O(n/2), as half of the list gets added to the stack
#
def palindrome?(node)
  stack = []
  cursor_fast = node
  cursor_slow = node

  # Iterate until cursor_fast is at the end and cursor_slow is at the middle
  until cursor_fast.nil? || cursor_fast.next.nil?
    stack << cursor_slow.data
    cursor_slow = cursor_slow.next
    cursor_fast = cursor_fast.next.next
  end

  # length is odd, so skip one
  unless cursor_fast.nil?
    cursor_slow = cursor_slow.next
  end

  # verify 2nd half of the string is the same as the first
  until cursor_slow.nil?
    return false unless cursor_slow.data == stack.pop
    cursor_slow = cursor_slow.next
  end

  true
end

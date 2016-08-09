# 2.8 Loop Detection
# Given a circular linked list, implement an algorithm that returns the node at
#   the beginning of the loop. A circular linked list is a linked list in which
#   the node's next pointer points to an earlier node, so as to make a loop in
#   the linked list
#

# Observation:
#   If two cursors are used in a manner that would normally find the middle of
#   the list, they will eventually collide. That collision point inside the
#   cycle occurs k nodes before reaching the beginning of the loop, where k is
#   also the distance from the beginning of the list to the beginning of the
#   loop.
#

def detect_loop(head)
  cursor_fast = head
  cursor_slow = head

  loop do
    # Check for lack of loop
    return nil if cursor_fast.nil? || cursor_fast.next.nil?

    # Advance the fast cursor at twice the speed of the slow cursor until they
    #   collide
    cursor_slow = cursor_slow.next
    cursor_fast = cursor_fast.next.next
    break if cursor_slow == cursor_fast
  end

  # The collision point occurs when the fast cursor is the same distance from
  #   the beginning of the loop as the distance from the head to the beginning
  #   of the loop, so advance from both head and the fast cursor until another
  #   collision occurs
  #
  cursor_slow = head
  until cursor_fast == cursor_slow
    cursor_fast = cursor_fast.next
    cursor_slow = cursor_slow.next
  end

  cursor_fast
end

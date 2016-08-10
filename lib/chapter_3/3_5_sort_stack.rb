# 3.5 Sort Stack
# Write a program to sort a stack such that the smallest items are on the top.
#   You can use an additional temporary stack, but you may not copy the elements
#   into any other data structure (such as an array). The stack supports the
#   following operations: push, pop, peek, empty?
#
require './lib/util/stack.rb'
include Util

# Time complexity: O(n^2), as all elements are shuffled between two lists n
#   times
# Space complexity: The temp stack utilizes an additional O(n) space
#
def sort_stack(stack)
  temp = Stack.new

  until stack.empty?
    # Move all items to temp stack and track the minimum value
    min = nil
    until stack.empty?
      val = stack.pop
      min = min.nil? ? val : [val, min].min
      temp.push(val)
    end

    # Move all back except the minimum value
    min_count = 0
    until temp.empty? || temp.peek < min
      val = temp.pop
      if val == min
        min_count += 1
      else
        stack.push(val)
      end
    end

    # Put min back on the second stack
    min_count.times { temp.push(min) }
  end

  # The temp stack is in largest -> smallest order. Reverse it back onto stack.
  stack.push(temp.pop) until temp.empty?
end

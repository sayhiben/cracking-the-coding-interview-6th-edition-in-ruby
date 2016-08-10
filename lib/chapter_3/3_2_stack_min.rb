# 3.2 Stack Min
# How would you design a stack which, in addition to push and pop, has a
#   function min which returns the miminum element? Push, pop, and min should
#   all operate in O(1) time.
#

# Observation:
#   In order to achieve O(1) time, we can't look through the stack to locate the
#   min value. This implies that we must cache it somewhere.
#

# This implementation uses a linked list to construct a stack. Each item on the
#   stack is a StackItem that contains the original data and an additional min
#   value. When adding items to the stack, the current min value is stored on
#   the new item. In order to provide the min value in the stack in O(1) time,
#   we inspect the top item on the stack
#
class Stack
  # Maintains the current min value in the stack in addition to the item's value
  class StackItem
    attr_accessor :value, :min
    def initialize(value, min)
      @value = value
      @min = min
    end
  end

  def initialize
    @stack = LinkedList.new
  end

  def to_a
    cursor = @stack.head
    ary = []
    until cursor.nil?
      ary << cursor.data.value
      cursor = cursor.next
    end
    ary
  end

  def push(value)
    min = @stack.head.nil? ? value : [@stack.head.data.min, value].min
    node = LinkedList::Node.new(StackItem.new(value, min))
    node.next = @stack.head
    @stack.head = node
  end

  def pop
    tmp = @stack.head
    @stack.head = @stack.head.next unless @stack.head.nil?
    tmp
  end

  def min
    @stack.head.data.min
  end
end

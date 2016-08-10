# 3.4 Queue via Stacks
# Implement a MyQueue class which implements a queue using two stacks
#

# Discussion:
#   Two stacks can be used such that the first is filled when items are queued,
#   and the second is depleted when items are dequeued. When the dequeueing
#   stack is empty, and a pop operation is made, the items from the queueing
#   stack are popped off and pushed onto the dequeueing stack.
#

require './lib/util/linked_list.rb'
include Util

# Implements a stack using a basic linked list
class Stack
  def initialize
    @stack = LinkedList.new
  end

  def push(val)
    node = LinkedList::Node.new(val)
    node.next = @stack.head
    @stack.head = node
  end

  def pop
    tmp = @stack.head
    @stack.head = @stack.head.next unless @stack.head.nil?
    tmp.data
  end

  def peek
    @stack.head
  end

  def to_a
    cursor = @stack.head
    ary = []
    until cursor.nil?
      ary << cursor.data
      cursor = cursor.next
    end
    ary
  end
end

# Implements a queue using two Stacks
class Queue
  def initialize
    @stacks = [Stack.new, Stack.new]
  end

  def enqueue(value)
    @stacks[0].push(value)
  end

  def dequeue
    fill_dequeue_stack if @stacks[1].peek.nil?
    @stacks[1].pop
  end

  def to_a
    @stacks[0].to_a.reverse + @stacks[1].to_a
  end

  private

  def fill_dequeue_stack
    until @stacks[0].peek.nil?
      @stacks[1].push(@stacks[0].pop)
    end
  end
end

module Util
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
      @stack.head.nil? ? nil : @stack.head.data
    end

    def empty?
      peek.nil?
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
end

module Util
  # Provides a basic implementation of a linked list
  class LinkedList
    attr_accessor :head

    # Provides a basic implementation of a linked list node
    class Node
      attr_accessor :data, :next

      def initialize(data)
        @data = data
      end

      def to_a
        cursor = self
        ary = []
        until cursor.nil?
          ary << cursor.data
          cursor = cursor.next
        end
        ary
      end

      def to_s
        @data.to_s
      end
    end

    def append(data)
      new_node = Node.new(data)
      if @head.nil?
        @head = new_node
      else
        cursor = @head
        cursor = cursor.next until cursor.next.nil?
        cursor.next = new_node
      end
    end

    def to_a
      @head.to_a
    end
  end
end

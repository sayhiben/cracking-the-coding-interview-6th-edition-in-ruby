module Util
  class LinkedList
    attr_accessor :head

    class Node
      attr_accessor :data, :next

      def initialize(data)
        @data = data
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
        while !cursor.next.nil?
          cursor = cursor.next
        end
        cursor.next = new_node
      end
    end

    def to_a
      cursor = @head
      ary = []
      while !cursor.nil?
        ary << cursor.data
        cursor = cursor.next
      end
      ary
    end
  end
end

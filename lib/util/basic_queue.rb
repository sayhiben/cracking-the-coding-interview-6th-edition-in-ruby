module Util
  # Implements a queue from LinkedList
  class BasicQueue
    attr_accessor :head, :tail

    def initialize
      @list = LinkedList.new
    end

    def enqueue(item)
      node = LinkedList::Node.new(item)
      @head = node if @head.nil?
      @tail.next = node unless @tail.nil?
      @tail = node
    end

    def dequeue
      tmp = @head
      @head = @head.next unless @head.nil?
      @tail = nil if @head.nil?
      tmp.nil? ? nil : tmp.data
    end

    def peek
      @head.nil? ? nil : @head.data
    end

    def empty?
      @head.nil?
    end
  end
end

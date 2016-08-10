module Util
  class Graph
    attr_accessor :nodes

    def initialize
      @nodes = []
    end

    def << (node)
      @nodes << node
    end

    class Node
      attr_accessor :data, :children, :marked

      def initialize(data)
        @data = data
        @children = []
        @marked = false
      end

      def marked?
        @marked
      end
    end
  end
end

module Util
  class Tree
    class Node
      attr_accessor :data, :left, :right
      def initialize(data)
        @data = data
      end
    end
  end
end

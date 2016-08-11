module Util
  class Tree
    class Node
      attr_accessor :data, :left, :right
      def initialize(data)
        @data = data
      end

      def to_s
        @data.to_s
      end

      def inspect
        to_s
      end
    end
  end
end

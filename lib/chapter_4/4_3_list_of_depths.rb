# 4.3 List of Depths
# Given a binary tree, design an algorithm which creates a linked list of all
#   the nodes at each depth (e.g., if you have a tree with depth D, you'll have
#   D linked lists)
#
#
# Discussion:
#   This can be solved by maintaining a collection of LinkedLists outside of a
#   DFS recursive algorithm that tracks the current depth.
#

# This implementation tracks an array of linked lists as it does a DFS. Each
#   recursive call is passed its depth, which is used to determine which index
#   in the array to append its value to.
#
# Time complexity: O(n), as build_lists is called once on each node
# Space complexity: O(n), as the storage of the depth lists contains each of the
#   values in the provided binary tree
#
class DepthLister
  attr_reader :depth_lists

  def initialize
    @depth_lists = []
  end

  def build_lists(node, depth = 0)
    @depth_lists << LinkedList.new if @depth_lists[depth].nil?
    @depth_lists[depth].append(node.data)
    build_lists(node.left, depth + 1) unless node.left.nil?
    build_lists(node.right, depth + 1) unless node.right.nil?
    @depth_lists
  end

  def lists_to_a
    @depth_lists.map(&:to_a)
  end
end

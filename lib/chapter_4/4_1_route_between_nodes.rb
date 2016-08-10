# 4.1 Route Between Nodes
# Given a directed graph, design an algorithm to find out whether there is a
#   route between two nodes.
#

# Discussion:
#   This can be solved with a DFS or BFS.
#

# This is a BFS that begins searching from start_node and ends when either the
#   end_node is found, or all nodes connected to start_node have been explored
#
# Time Complexity: O(n), as it may explore every node
# Space Complexity: The queue may take an additional O(n) space
#
def route_between?(start_node, end_node)
  queue = BasicQueue.new
  queue.enqueue(start_node)
  until queue.empty?
    node = queue.dequeue
    return true if node == end_node
    node.children.each do |child|
      # Mark the children so that we don't end up in a loop
      queue.enqueue(child) unless child.marked?
      child.marked = true
    end
  end
  false
end

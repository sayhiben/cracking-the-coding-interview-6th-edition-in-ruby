# 4.7 Build Order
# You are given a list of projects and a list of dependencies (which is a list
#   of pairs of projects, where the second project is dependent on the first
#   project). All of a project's dependencies must be built before the project
#   is. Find a build order that will allow the projects to be built. If there's
#   no valid build order, return an error.
#
# Discussion:
#   This is traditionally addressed with a topological sort in build systems,
#   which is essentially just a slightly modified DFS on a graph
#

class DependencySorter
  def initialize(projects, dependencies)
    build_graph(projects, dependencies)
    @result_stack = []
  end

  def sort
    # Look at every node in the graph; some may not be connected to one another
    @graph.nodes.each do |node|
      # Skip if it's already in the graph
      next if @result_stack.include?(node)

      # Reset the nodes we've seen this iteration
      @visited_nodes = []
      explore(node)
    end
    # DFS gives us the leaf nodes first, but we want to build them first, so
    #   reverse the stack
    @result_stack.reverse.map { |node| node.data }
  end

  def explore(node)
    # If we're re-exploring a node that's already been visited this round,
    #   there's a cycle in the graph
    raise ArgumentError if @visited_nodes.include?(node)

    @visited_nodes << node
    node.children.each do |child|
      # Skip items we've already added to the result stack
      next if @result_stack.include?(child)
      explore(child)
    end
    @result_stack << node
  end

  private

  def build_graph(nodes, edges)
    lookup = {}
    @graph = Graph.new

    # Add all nodes to the graph and save in a lookup hash so that we can add
    #   edges
    nodes.each do |node|
      lookup[node] = Graph::Node.new(node)
      @graph << lookup[node]
    end

    # Add edges
    edges.each { |edge| lookup[edge[0]].children << lookup[edge[1]] }
  end
end

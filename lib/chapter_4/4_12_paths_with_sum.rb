# 4.12 Paths with Sum
# You are given a binary tree in which each node contains an integer value
#   (which might be positive or negative). Design an algorithm to count the
#   number of paths that sum to a given value. The path does not need to start
#   or end at the root or a leaf, but it must go downwards (traveling only from
#   parent nodes to child nodes).
#

# This brute-force approach inspects the sum of each path starting from each
#   node. It has duplicated work in that the sum of subpaths will be computed
#   more than once.
#
# Time complexity: O(n^2) in the case where the tree is completely linear
#
def paths_with_sum(node, sum)
  paths = []
  paths += [node] if node.data == sum
  paths += find_paths(node, sum, [])
  paths += paths_with_sum(node.left, sum) unless node.left.nil?
  paths += paths_with_sum(node.right, sum) unless node.right.nil?
  paths
end

def find_paths(node, sum, prefix, sum_paths = [])
  unless node.nil?
    prefix += [node]
    sum_paths << prefix if path_sum(prefix) == sum
    sum_paths = find_paths(node.left, sum, prefix, sum_paths)
    sum_paths = find_paths(node.right, sum, prefix, sum_paths)
  end
  sum_paths
end

def path_sum(nodes)
  sum = 0
  nodes.each { |node| sum += node.data }
  sum
end

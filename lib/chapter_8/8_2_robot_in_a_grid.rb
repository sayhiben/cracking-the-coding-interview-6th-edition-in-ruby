# 8.2 Robot in a Grid
# Imagine a robot sitting on the upper left corner of a grid with r rows and c
#   columns. The robot can only move in two directions, right and down, but
#   certain cells are "off limits" such that the robot cannot step on them.
#   Design an algorithm to find a path for the robot from the top left to the
#   bottom right.
#

def robot_path(grid)
  visited = Set.new
  find_path(0, 0, grid, visited)
end

def find_path(x, y, grid, visited, current_path = [])
  visited << [x, y]
  return current_path if y == grid.length - 1 && x == grid[0].length - 1

  result = false
  # Move right if possible
  if can_move_to(x + 1, y, grid, visited)
    result = find_path(x + 1, y, grid, visited, current_path + [[x + 1, y]])
  end

  # Move down if moving right didn't work out & down is possible
  if !result && can_move_to(x, y + 1, grid, visited)
    result = find_path(x, y + 1, grid, visited, current_path + [[x, y + 1]])
  end

  result
end

# Verifies we're not moving out of bounds, haven't been to this location before,
#   and the space isn't blocked
def can_move_to(x, y, grid, visited)
  return false if visited.include?([x, y])
  return false if y >= grid.length
  return false if x >= grid[0].length
  grid[y][x] != 1
end

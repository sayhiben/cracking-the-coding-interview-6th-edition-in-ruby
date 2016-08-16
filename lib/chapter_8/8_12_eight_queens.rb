# 8.12 Eight Queens
# Write an algorithm to print all ways of arranging eight queens on an 8x8 chess
#   board so that none of them share the same row, column, or diagonal. In this
#   case, "diagonal" means all diagonals, not just the two that bisect the board
#

def eight_queens(locations = [], solutions = [])
  if locations.length == 8
    solutions << locations
    return
  end
  (0..7).each do |col|
    row = locations.length
    if check_cols(locations, col) && check_diagonals(locations, row, col)
      eight_queens(locations + [col], solutions)
    end
  end
  solutions
end

def check_cols(locations, col)
  locations.each do |occupied_col|
    return false if occupied_col == col
  end
  true
end

def check_diagonals(locations, row, col)
  locations.each_with_index do |occupied_col, occupied_row|
    row_diff = (occupied_row - row).abs
    col_diff = (occupied_col - col).abs
    return false if row_diff == col_diff
  end
  true
end

# 1.8 Zero Matrix
# Write an algoritm such that if an element in an MxN matrix is 0, its entire
#   row and column are set to 0.

# This solution operates in two steps. First, it collects the coordinates of
#   each zero value in the matrix. Then, it operates on each row and column
#   stored in the coordinates. The two-pass method is used to prevent "blackout"
#   situations.
#
# Time complexity: O(m*n) time is used due to having to inspect the entire
#   matrix.
# Space complexity: O(m+n) space will be used when all coordinates are set to
#   zero to begin with. The coordinates arrays would have one element for each
#   row and column.
#
class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def zero
    coords = zero_coordinates
    zero_rows(coords[:rows])
    zero_columns(coords[:cols])
    @matrix
  end

  private

  def zero_coordinates
    coordinates = { rows: [], cols: [] }
    @matrix.each_with_index do |row, i|
      row.each_with_index do |value, j|
        if value.zero?
          coordinates[:rows] |= [i]
          coordinates[:cols] |= [j]
        end
      end
    end
    coordinates
  end

  def zero_rows(rows)
    rows.each do |row|
      @matrix[row] = @matrix[row].map { 0 }
    end
  end

  def zero_columns(cols)
    cols.each do |column|
      @matrix.each do |row|
        row[column] = 0
      end
    end
  end
end

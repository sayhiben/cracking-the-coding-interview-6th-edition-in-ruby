# 1.7 Rotate Matrix
# Given an image represented by an NxN matrix, where each pixel in the image is
#   4 bytes, write a method to rotate the image by 90 degrees. Can this be done
#   in place?
#

# Observations:
#   - The fact that each pixel is 4 bytes seems to be superfluous information
#   - Image rotation can be achieved by transposing and reversing the matrix,
#     but this would not provide an in-place rotation
#   - The image is square, so rotation can be done in-place by rotating each
#     "layer" of the matrix

def rotate(matrix)
  n = matrix.length
  (0..(n / 2) - 1).each do |layer|
    last = (n - 1) - layer
    (layer..last - 1).each do |i|
      offset = i - layer
      top = matrix[layer][i]
      # left -> top
      matrix[layer][i] = matrix[last - offset][layer]
      # bottom -> left
      matrix[last - offset][layer] = matrix[last][last - offset]
      # right -> bottom
      matrix[last][last - offset] = matrix[i][last]
      # top -> right
      matrix[i][last] = top # matrix[last - offset][layer]
    end
  end
  matrix
end

require 'test_helper.rb'
require './lib/chapter_1/1_8_zero_matrix.rb'

class TestZeroMatrix < Minitest::Test
  def test_single
    matrix = [[0]]
    assert_equal matrix, Matrix.new(matrix).zero
  end

  def test_zeroed
    matrix = [
      [1, 1, 0, 1],
      [1, 1, 1, 1],
      [0, 1, 1, 1],
      [1, 1, 1, 0]
    ]
    result = [
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]
    assert_equal result, Matrix.new(matrix).zero
  end
end

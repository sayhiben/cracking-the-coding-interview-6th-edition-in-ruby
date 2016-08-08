require 'test_helper.rb'
require './lib/chapter_1/1_7_rotate_matrix.rb'

class TestRotateMatrix < Minitest::Test
  def test_rotate_single
    matrix = [[1]]
    rotated = [[1]]
    assert_equal rotated, rotate(matrix)
  end

  def test_rotate_small
    matrix = [
      [1, 2],
      [3, 4]
    ]
    rotated = [
      [3, 1],
      [4, 2]
    ]
    assert_equal rotated, rotate(matrix)
  end

  def test_rotate_even
    matrix = [
      ['a', 'b', 'c', 'd'],
      ['e', 'f', 'g', 'h'],
      ['i', 'j', 'k', 'l'],
      ['m', 'n', 'o', 'p']
    ]
    rotated = [
      ['m', 'i', 'e', 'a'],
      ['n', 'j', 'f', 'b'],
      ['o', 'k', 'g', 'c'],
      ['p', 'l', 'h', 'd']
    ]
    assert_equal rotated, rotate(matrix)
  end

  def test_rotate_odd
    matrix = [
      ['a', 'b', 'c', 'd', '0'],
      ['e', 'f', 'g', 'h', '1'],
      ['i', 'j', 'k', 'l', '2'],
      ['m', 'n', 'o', 'p', '3'],
      ['q', 'r', 's', 't', '4']
    ]
    rotated = [
      ['q', 'm', 'i', 'e', 'a'],
      ['r', 'n', 'j', 'f', 'b'],
      ['s', 'o', 'k', 'g', 'c'],
      ['t', 'p', 'l', 'h', 'd'],
      ['4', '3', '2', '1', '0']
    ]
    assert_equal rotated, rotate(matrix)
  end
end

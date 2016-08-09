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
      %w(a b c d),
      %w(e f g h),
      %w(i j k l),
      %w(m n o p)
    ]
    rotated = [
      %w(m i e a),
      %w(n j f b),
      %w(o k g c),
      %w(p l h d)
    ]
    assert_equal rotated, rotate(matrix)
  end

  def test_rotate_odd
    matrix = [
      %w(a b c d 0),
      %w(e f g h 1),
      %w(i j k l 2),
      %w(m n o p 3),
      %w(q r s t 4)
    ]
    rotated = [
      %w(q m i e a),
      %w(r n j f b),
      %w(s o k g c),
      %w(t p l h d),
      %w(4 3 2 1 0)
    ]
    assert_equal rotated, rotate(matrix)
  end
end

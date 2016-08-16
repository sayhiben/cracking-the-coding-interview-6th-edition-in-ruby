require 'test_helper.rb'
require './lib/chapter_8/8_10_paint_fill.rb'

class TestPaintFill < Minitest::Test
  def test_paint_fill
    screen = [
      [0, 1, 1, 1, 0],
      [1, 5, 5, 1, 0],
      [1, 5, 5, 5, 1],
      [1, 5, 5, 5, 1],
      [0, 1, 1, 1, 0],
    ]
    expected = [
      [0, 1, 1, 1, 0],
      [1, 7, 7, 1, 0],
      [1, 7, 7, 7, 1],
      [1, 7, 7, 7, 1],
      [0, 1, 1, 1, 0],
    ]
    assert_equal expected, paint_fill(screen, [1, 2], 7)
  end

  def test_paint_fill_corner
    screen = [
      [0, 1, 1, 1, 0],
      [1, 5, 5, 1, 0],
      [1, 5, 5, 5, 1],
      [1, 5, 5, 5, 1],
      [0, 1, 1, 1, 0],
    ]
    expected = [
      [7, 1, 1, 1, 0],
      [1, 5, 5, 1, 0],
      [1, 5, 5, 5, 1],
      [1, 5, 5, 5, 1],
      [0, 1, 1, 1, 0],
    ]
    assert_equal expected, paint_fill(screen, [0, 0], 7)
  end
end

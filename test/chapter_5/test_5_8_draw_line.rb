require 'test_helper.rb'
require './lib/chapter_5/5_8_draw_line.rb'

class TestDrawLine < Minitest::Test
  def test_draw_line
    screen = [
      [], [], [], [],
      [], [], [], []
    ]
    width = 32
    x1 = 6
    x2 = 21
    y = 1
    expected = [
      [0b0000_0000], [0b0000_0000], [0b0000_0000], [0b0000_0000],
      [0b0000_0011], [0b1111_1111], [0b1111_1100], [0b0000_0000]
    ]
    assert_equal expected, draw_line(screen, width, x1, x2, y)

    expected = [
      [0b0000_0000], [0b0000_0000], [0b0000_0000], [0b0000_0000],
      [0b0000_0000], [0b0000_0000], [0b0011_1100], [0b0000_0000]
    ]
    assert_equal expected, draw_line(screen, width, 18, x2, y)

    expected = [
      [0b0000_0000], [0b0000_0000], [0b0000_0000], [0b0000_0000],
      [0b1111_1111], [0b1111_1111], [0b1111_1111], [0b1111_1111]
    ]
    assert_equal expected, draw_line(screen, width, 0, 31, y)
  end
end

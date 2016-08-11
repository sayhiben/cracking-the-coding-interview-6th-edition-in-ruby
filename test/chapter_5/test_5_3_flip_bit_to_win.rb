require 'test_helper.rb'
require './lib/chapter_5/5_3_flip_bit_to_win.rb'

class TestFlipBitToWin < Minitest::Test
  def test_flip_bit_to_win
    assert_equal 8, flip_bit_to_win(0b110_1110_1111)
    assert_equal 5, flip_bit_to_win(0b100_1100_1111)
    assert_equal 7, flip_bit_to_win(0b111_0111_0111)
  end
end

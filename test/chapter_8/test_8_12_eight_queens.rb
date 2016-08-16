require 'test_helper.rb'
require './lib/chapter_8/8_12_eight_queens.rb'

class TestEightQueens < Minitest::Test
  def test_eight_queens
    assert eight_queens().include?([3, 1, 7, 4, 6, 0, 2, 5])
  end
end

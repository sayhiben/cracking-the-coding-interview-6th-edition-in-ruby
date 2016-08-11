require 'test_helper.rb'
require './lib/chapter_5/5_4_next_number.rb'

class TestNextNumber < Minitest::Test
  def test_next_number
    assert_equal "9, 5", next_numbers(6)
    assert_equal "6, 3", next_numbers(5)
    assert_equal "19, 13", next_numbers(14)
  end
end

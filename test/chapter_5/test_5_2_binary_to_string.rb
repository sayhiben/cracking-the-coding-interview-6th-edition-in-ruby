require 'test_helper.rb'
require './lib/chapter_5/5_2_binary_to_string.rb'

class TestBinaryToString < Minitest::Test
  def test_binary_to_string
    assert_equal '.0101', double_to_binary(0.3125)
    assert_equal 'ERROR', double_to_binary(0.72)
    assert_equal 'ERROR', double_to_binary(2.0)
    assert_equal 'ERROR', double_to_binary(-0.5)
  end
end

require 'test_helper.rb'
require './lib/chapter_8/8_3_magic_index.rb'

class TestMagicIndex < Minitest::Test
  def test_magic_index
    ary = [-3, 0, 1, 3, 5, 6, 7, 8, 9, 10]
    assert_equal 3, magic_index(ary)

    ary = [0, 5, 10, 30, 50, 60, 70, 80, 90, 100]
    assert_equal 0, magic_index(ary)

    ary = [-1, 0, 1, 2, 3, 4, 5, 6, 7, 9]
    assert_equal 9, magic_index(ary)
  end
end

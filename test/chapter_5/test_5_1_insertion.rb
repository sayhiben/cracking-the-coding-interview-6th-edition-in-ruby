require 'test_helper.rb'
require './lib/chapter_5/5_1_insertion.rb'

class TestInsertion < Minitest::Test
  def test_insertion
    n = 0b100_1010_0100
    m = 0b1_0011
    i = 2
    j = 6
    assert_equal 0b100_1100_1100, bit_insert(n, m, i, j)
  end
end

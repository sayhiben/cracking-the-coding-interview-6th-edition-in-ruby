require 'test_helper.rb'
require './lib/chapter_5/5_7_pairwise_swap.rb'

class TestPairwiseSwap < Minitest::Test
  def test_pairwise_swap
    assert_equal 0b01111001, pairwise_swap(0b10110110)
  end
end

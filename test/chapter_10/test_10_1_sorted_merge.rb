require 'test_helper.rb'
require './lib/chapter_10/10_1_sorted_merge.rb'

class TestSortedMerge < Minitest::Test
  def test_sorted_merge
    a = [0, 12, 52, 53, 54, 72, 100, nil, nil, nil, nil, nil, nil, nil]
    b = [0, 1, 2, 51, 55, 60, 101]
    expected = [0, 0, 1, 2, 12, 51, 52, 53, 54, 55, 60, 72, 100, 101]
    assert_equal expected, sorted_merge(a, b)
  end
end

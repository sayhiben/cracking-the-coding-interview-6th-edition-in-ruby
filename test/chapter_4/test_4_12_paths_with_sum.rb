require 'test_helper.rb'
require './lib/chapter_4/4_12_paths_with_sum.rb'

class TestPathsWithSum < Minitest::Test
  def setup
    values = [10, 5, -3, 3, 2, 11, 3, -2, 1]
    @nodes = values.map { |value| Tree::Node.new(value) }
    @nodes[0].left = @nodes[1]
    @nodes[0].right = @nodes[2]
    @nodes[1].left = @nodes[3]
    @nodes[1].right = @nodes[4]
    @nodes[2].right = @nodes[5]
    @nodes[3].left = @nodes[6]
    @nodes[3].right = @nodes[7]
    @nodes[4].right = @nodes[8]
  end

  def test_paths_with_sum
    sum = 8
    expected = [
      [@nodes[1], @nodes[3]],
      [@nodes[1], @nodes[4], @nodes[8]],
      [@nodes[2], @nodes[5]]
    ]
    assert_equal expected, paths_with_sum(@nodes[0], 8)
  end
end

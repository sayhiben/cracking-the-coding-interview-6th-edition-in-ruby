require 'test_helper.rb'
require './lib/chapter_4/4_2_minimal_tree.rb'

class TestMinimalTree < Minitest::Test
  def test_to_bst
    values = [5, 12, 13, 15, 20, 50, 90]
    assert validate_bst(to_bst(values))
  end

  def validate_bst(node, min = nil, max = nil)
    if node.nil? || (!min.nil? && node.data < min) || (!max.nil? && node.data > max)
      return false
    end

    left_valid = node.left.nil? ? true : validate_bst(node.left, min, node.data)
    right_valid = node.right.nil? ? true : validate_bst(node.left, min, node.data)

    left_valid && right_valid
  end
end

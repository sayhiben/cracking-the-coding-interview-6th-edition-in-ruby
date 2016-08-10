require 'test_helper.rb'
require './lib/chapter_4/4_5_validate_bst.rb'

class TestValidateBST < Minitest::Test
  def setup
    @nodes = [
      Tree::Node.new(20),
      Tree::Node.new(20),
      Tree::Node.new(25),
      Tree::Node.new(5),
      Tree::Node.new(23),
      Tree::Node.new(27),
      Tree::Node.new(4),
      Tree::Node.new(6),
      Tree::Node.new(26),
      Tree::Node.new(15)
    ]
    @nodes[0].left = @nodes[1]
    @nodes[0].right = @nodes[2]
    @nodes[1].left = @nodes[3]
    @nodes[2].left = @nodes[4]
    @nodes[2].right = @nodes[5]
    @nodes[3].left = @nodes[6]
    @nodes[3].right = @nodes[7]
    @nodes[5].left = @nodes[8]
    @nodes[7].right = @nodes[9]
  end

  def test_validate_bst
    assert validate_bst(@nodes[0])
  end

  def test_invalid_bst
    @nodes[0].right = Tree::Node.new(@nodes[0].data)
    assert !validate_bst(@nodes[0])

    @nodes[0].right = @nodes[2]
    @nodes[7].right = nil
    @nodes[4].left = @nodes[9]
    assert !validate_bst(@nodes[0])
  end
end

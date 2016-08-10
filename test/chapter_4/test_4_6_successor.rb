require 'test_helper.rb'
require './lib/chapter_4/4_6_successor.rb'

class TestSuccessor < Minitest::Test
  def setup
    @nodes = [
      Tree::Node.new(30),
      Tree::Node.new(20),
      Tree::Node.new(32),
      Tree::Node.new(15),
      Tree::Node.new(25),
      Tree::Node.new(31),
      Tree::Node.new(21),
      Tree::Node.new(27)
    ]
    @nodes[0].left = @nodes[1]
    @nodes[0].right = @nodes[2]
    @nodes[1].parent = @nodes[0]
    @nodes[1].left = @nodes[3]
    @nodes[1].right = @nodes[4]
    @nodes[2].parent = @nodes[0]
    @nodes[2].left = @nodes[5]
    @nodes[3].parent = @nodes[1]
    @nodes[4].parent = @nodes[1]
    @nodes[4].left = @nodes[6]
    @nodes[4].right = @nodes[7]
    @nodes[5].parent = @nodes[2]
    @nodes[6].parent = @nodes[4]
    @nodes[7].parent = @nodes[4]
  end

  def test_successor_right_child
    assert_equal @nodes[6].data, successor(@nodes[1])
    assert_equal @nodes[7].data, successor(@nodes[4])
  end

  def test_successor_ancestor
    assert_equal @nodes[1].data, successor(@nodes[3])
    assert_equal @nodes[2].data, successor(@nodes[5])
    assert_equal @nodes[4].data, successor(@nodes[6])
    assert_equal @nodes[0].data, successor(@nodes[7])
  end

  def test_no_successor
    assert_nil successor(@nodes[2])
  end
end

require 'test_helper.rb'
require './lib/chapter_4/4_3_list_of_depths.rb'

class TestListOfDepths < Minitest::Test
  def setup
    @nodes = {
      'a' => Tree::Node.new('a'),
      'b' => Tree::Node.new('b'),
      'c' => Tree::Node.new('c'),
      'd' => Tree::Node.new('d'),
      'e' => Tree::Node.new('e'),
      'f' => Tree::Node.new('f'),
      'g' => Tree::Node.new('g'),
      'h' => Tree::Node.new('h'),
      'i' => Tree::Node.new('i'),
      'j' => Tree::Node.new('j')
    }
    @nodes['a'].left = @nodes['b']
    @nodes['a'].right = @nodes['c']
    @nodes['b'].left = @nodes['d']
    @nodes['b'].right = @nodes['e']
    @nodes['c'].left = @nodes['f']
    @nodes['e'].left = @nodes['g']
    @nodes['e'].right = @nodes['h']
    @nodes['h'].right = @nodes['i']
    @nodes['i'].left = @nodes['j']
  end

  def test_depth_lists
    expected = [
      %w(a),
      %w(b c),
      %w(d e f),
      %w(g h),
      %w(i),
      %w(j)
    ]
    depth_lister = DepthLister.new
    depth_lister.build_lists(@nodes['a'])
    assert_equal expected, depth_lister.lists_to_a
  end
end

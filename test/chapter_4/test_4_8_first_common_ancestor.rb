require 'test_helper.rb'
require './lib/chapter_4/4_8_first_common_ancestor.rb'

class TestFirstCommonAncestor < Minitest::Test
  def setup
    @nodes = {
      'a' => Tree::Node.new('a'),
      'b' => Tree::Node.new('b'),
      'c' => Tree::Node.new('c'),
      'd' => Tree::Node.new('d'),
      'e' => Tree::Node.new('e'),
      'f' => Tree::Node.new('f'),
      'g' => Tree::Node.new('g')
    }
    @nodes['a'].left = @nodes['b']
    @nodes['a'].right = @nodes['c']
    @nodes['b'].left = @nodes['g']
    @nodes['c'].left = @nodes['d']
    @nodes['c'].right = @nodes['e']
    @nodes['e'].left = @nodes['f']
  end

  def test_first_common_ancestor
    assert_equal 'c', first_common_ancestor(@nodes['a'], 'f', 'd')
    assert_equal 'a', first_common_ancestor(@nodes['a'], 'g', 'e')
    assert_equal 'a', first_common_ancestor(@nodes['a'], 'b', 'c')
    assert_equal 'b', first_common_ancestor(@nodes['a'], 'b', 'g')
  end
end

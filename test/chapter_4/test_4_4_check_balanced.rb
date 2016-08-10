require 'test_helper.rb'
require './lib/chapter_4/4_4_check_balanced.rb'

class TestCheckBalanced < Minitest::Test
  def setup
    @nodes = {
      'a' => Tree::Node.new('a'),
      'b' => Tree::Node.new('b'),
      'c' => Tree::Node.new('c'),
      'd' => Tree::Node.new('d'),
      'e' => Tree::Node.new('e'),
      'f' => Tree::Node.new('f')
    }
  end

  def test_check_balanced
    @nodes['a'].left = @nodes['b']
    @nodes['a'].right = @nodes['c']
    @nodes['b'].left = @nodes['d']
    @nodes['b'].right = @nodes['e']
    @nodes['c'].left = @nodes['f']
    assert check_balanced(@nodes['a'])
  end

  def test_check_unbalanced
    @nodes['a'].left = @nodes['b']
    @nodes['a'].right = @nodes['c']
    @nodes['b'].right = @nodes['d']
    @nodes['d'].left = @nodes['e']
    @nodes['c'].left = @nodes['f']
    assert !check_balanced(@nodes['a'])
  end
end

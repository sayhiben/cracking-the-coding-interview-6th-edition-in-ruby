require 'test_helper.rb'
require './lib/chapter_4/4_10_check_subtree.rb'

class TestCheckSubtree < Minitest::Test
  def setup
    @nodes = {}
    ('a'..'g').each do |data|
      @nodes[data] = Tree::Node.new(data)
    end
    @nodes['a'].left = @nodes['b']
    @nodes['a'].right = @nodes['c']
    @nodes['b'].left = @nodes['d']
    @nodes['b'].right = @nodes['e']
    @nodes['c'].right = @nodes['f']
    @nodes['e'].right = @nodes['g']
  end
  def test_check_subtree
    assert check_subtree(@nodes['a'], @nodes['b'])
  end

  def test_not_subtree
    nodes = {}
    ('a'..'g').each do |data|
      nodes[data] = Tree::Node.new(data)
    end
    nodes['a'].left = nodes['b']
    nodes['a'].right = nodes['c']
    nodes['b'].left = nodes['d']
    nodes['b'].right = nodes['e']
    nodes['c'].right = nodes['f']
    nodes['e'].left = nodes['g']
    assert !check_subtree(@nodes['a'], nodes['b'])
  end
end

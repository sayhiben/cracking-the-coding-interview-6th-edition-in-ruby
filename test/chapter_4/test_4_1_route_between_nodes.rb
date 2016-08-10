require 'test_helper.rb'
require './lib/chapter_4/4_1_route_between_nodes.rb'

class TestRouteBetweenNodes < Minitest::Test
  def setup
    @graph = Graph.new
    @nodes = {
      'a' => Graph::Node.new('a'),
      'b' => Graph::Node.new('b'),
      'c' => Graph::Node.new('c'),
      'd' => Graph::Node.new('d'),
      'e' => Graph::Node.new('e'),
      'f' => Graph::Node.new('f'),
      'g' => Graph::Node.new('g')
    }
    @nodes['a'].children = [@nodes['c'], @nodes['d']]
    @nodes['c'].children = [@nodes['d']]
    @nodes['d'].children = [@nodes['e']]
    @nodes['e'].children = [@nodes['f']]
    @nodes['f'].children = [@nodes['g']]
    @nodes.each { |_key, node| @graph << node }
  end

  def test_route_between
    assert route_between?(@nodes['a'], @nodes['g'])
  end

  def test_no_route_between
    assert !route_between?(@nodes['a'], @nodes['b'])
  end

  def test_no_cycle_bug
    @nodes['e'].children << @nodes['c']
    assert route_between?(@nodes['a'], @nodes['g'])
  end
end

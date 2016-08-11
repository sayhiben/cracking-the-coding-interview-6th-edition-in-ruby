require 'test_helper.rb'
require './lib/chapter_4/4_9_bst_sequences.rb'

class TestFirstCommonAncestor < Minitest::Test
  def test_bst_sequences
    nodes = {
      '2' => Tree::Node.new(2),
      '1' => Tree::Node.new(1),
      '3' => Tree::Node.new(3)
    }
    nodes['2'].left = nodes['1']
    nodes['2'].right = nodes['3']
    assert_equal [[2, 1, 3], [2, 3, 1]], bst_sequences(nodes['2'])
  end

  def test_larger_bst_sequences
    nodes = {}
    %w(50 20 60 25 70).each do |data|
      nodes[data] = Tree::Node.new(data.to_i)
    end
    nodes['50'].left = nodes['20']
    nodes['50'].right = nodes['60']
    nodes['20'].right = nodes['25']
    nodes['60'].right = nodes['70']
    assert_equal 6, bst_sequences(nodes['50']).length
  end
end

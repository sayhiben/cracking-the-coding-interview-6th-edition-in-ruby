require 'test_helper.rb'
require './lib/chapter_4/4_11_random_node.rb'

class TestRandomNode < Minitest::Test
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

  def test_random_node
    counts = {}
    @nodes.each { |_key, node| counts[node.data] = 0 }
    # Simulate this a bunch of times then verify by checking within a reasonable
    #   confidence interval
    (@nodes.length * 1000).times do
      result = random_node(@nodes['a'])
      counts[result] += 1
    end
    ap 'This test is a volatile simulation and may occasionally report a '\
       'false negative. Each of the below values should be ROUGHLY 1000.'
    ap counts
    counts.each { |_key, count| assert (1000 - count).abs < 100 }
  end
end

require 'test_helper.rb'
require './lib/chapter_2/2_3_delete_middle_node.rb'

class TestDeleteMiddleNode < Minitest::Test
  def setup
    @data = ('a'..'f').to_a
    @list = LinkedList.new
    @data.each { |val| @list.append(val) }
  end

  def test_delete_middle_node
    c_node = @list.head
    c_node = c_node.next until c_node.data == 'c'
    delete_middle_node(c_node)
    assert_equal %w(a b d e f), @list.to_a
  end
end

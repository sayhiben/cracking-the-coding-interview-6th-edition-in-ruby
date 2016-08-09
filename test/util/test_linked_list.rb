require 'test_helper.rb'
require './lib/util/linked_list.rb'

class TestLinkedList < Minitest::Test
  include Util

  def setup
    @data = %w(qwer tyui opas)
  end

  def test_node_has_data
    assert_equal @data[0], LinkedList::Node.new(@data[0]).data
  end

  def test_node_to_s
    assert_equal @data[0].to_s, LinkedList::Node.new(@data[0]).to_s
  end

  def test_list_can_append_first_node
    list = LinkedList.new
    list.append(@data[0])
    assert_instance_of LinkedList::Node, list.head
  end

  def test_list_can_append_additional_nodes
    list = LinkedList.new
    list.append(@data[0])
    list.append(@data[1])
    assert_equal @data[1], list.head.next.data
  end

  def test_list_to_a
    list = LinkedList.new
    @data.each { |val| list.append(val) }
    assert_equal @data, list.to_a
  end
end

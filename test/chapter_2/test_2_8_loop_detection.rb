require 'test_helper.rb'
require './lib/chapter_2/2_8_loop_detection.rb'

class TestLoopDetection < Minitest::Test
  def setup
    @list1 = LinkedList.new
  end

  def populate_list(list, data)
    data.each { |val| list.append(val) }
  end

  def node_at_index(list, index)
    cursor = list.head
    i = 0
    until i == index
      i += 1
      cursor = cursor.next
    end
    cursor
  end

  def test_loop_detection_even
    populate_list(@list1, %w(a b c d e f))
    # f -> c
    last_node = node_at_index(@list1, 5)
    last_node.next = node_at_index(@list1, 2)
    assert_equal node_at_index(@list1, 2), detect_loop(@list1.head)
  end

  def test_loop_detection_odd
    populate_list(@list1, %w(a b c d e f))
    # f -> d
    last_node = node_at_index(@list1, 5)
    last_node.next = node_at_index(@list1, 3)
    assert_equal node_at_index(@list1, 3), detect_loop(@list1.head)
  end

  def test_no_loop
    populate_list(@list1, %w(a b c d e f))
    assert_nil detect_loop(@list1.head)
  end
end

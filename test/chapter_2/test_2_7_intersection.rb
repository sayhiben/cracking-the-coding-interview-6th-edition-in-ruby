require 'test_helper.rb'
require './lib/util/linked_list.rb'
require './lib/chapter_2/2_7_intersection.rb'

class TestIntersection < Minitest::Test
  include Util

  def setup
    @list1 = LinkedList.new
    @list2 = LinkedList.new
    @list3 = LinkedList.new
  end

  def populate_list(list, data)
    data.each { |val| list.append(val) }
  end

  def append_list(list1, list2)
    cursor = list1.head
    cursor = cursor.next until cursor.next.nil?
    cursor.next = list2.head
  end

  def test_intersection_same_length
    populate_list(@list1, %w(a b c))
    populate_list(@list2, %w(d e f))
    populate_list(@list3, %w(g h i))
    append_list(@list1, @list3)
    append_list(@list2, @list3)
    assert_equal @list3.head, intersection(@list1.head, @list2.head)
  end

  def test_intersection_first_longer
    populate_list(@list1, %w(a b c d e))
    populate_list(@list2, %w(d e f))
    populate_list(@list3, %w(g h i))
    append_list(@list1, @list3)
    append_list(@list2, @list3)
    assert_equal @list3.head, intersection(@list1.head, @list2.head)
  end

  def test_intersection_second_longer
    populate_list(@list1, %w(a b c))
    populate_list(@list2, %w(d e f 0 1 2))
    populate_list(@list3, %w(g h i))
    append_list(@list1, @list3)
    append_list(@list2, @list3)
    assert_equal @list3.head, intersection(@list1.head, @list2.head)
  end

  def test_no_intersection
    populate_list(@list1, [1, 2, 3])
    populate_list(@list2, [6, 2, 8])
    assert_nil intersection(@list1.head, @list2.head)
  end
end

require 'test_helper.rb'
require './lib/chapter_2/2_5_sum_lists.rb'

class TestSumLists < Minitest::Test
  def setup
    @list1 = LinkedList.new
    @list2 = LinkedList.new
  end

  def populate_list(list, data)
    data.each { |val| list.append(val) }
  end

  def test_sum_lists
    populate_list(@list1, [7, 1, 6])
    populate_list(@list2, [5, 9, 2])
    assert_equal [2, 1, 9], sum_lists(@list1.head, @list2.head).to_a
  end

  def test_sum_lists_extra_carry
    populate_list(@list1, [7, 8, 6])
    populate_list(@list2, [5, 9, 3])
    assert_equal [2, 8, 0, 1], sum_lists(@list1.head, @list2.head).to_a
  end

  def test_sum_lists_forward
    populate_list(@list1, [6, 1, 7])
    populate_list(@list2, [2, 9, 5])
    assert_equal [9, 1, 2], sum_lists_forward(@list1.head, @list2.head).to_a
  end

  def test_sum_lists_forward_extra_carry
    populate_list(@list1, [6, 8, 7])
    populate_list(@list2, [3, 9, 5])
    assert_equal [1, 0, 8, 2], sum_lists_forward(@list1.head, @list2.head).to_a
  end
end

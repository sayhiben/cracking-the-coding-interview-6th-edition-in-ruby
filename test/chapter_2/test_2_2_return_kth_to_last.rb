require 'test_helper.rb'
require './lib/chapter_2/2_2_return_kth_to_last.rb'

class TestReturnKthToLast < Minitest::Test
  def setup
    @data = ('a'..'z').to_a
    @list = LinkedList.new
    @data.each { |val| @list.append(val) }
  end

  def test_return_kth_to_last
    assert_equal @data[20], kth_to_last(@list.head, 6)
  end

  def test_return_last
    assert_equal @data[25], kth_to_last(@list.head, 1)
  end

  def test_return_first
    assert_equal @data[0], kth_to_last(@list.head, 26)
  end
end

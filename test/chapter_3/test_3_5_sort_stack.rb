require 'test_helper.rb'
require './lib/util/stack.rb'
require './lib/chapter_3/3_5_sort_stack.rb'

class TestSortStack < Minitest::Test
  include Util

  def test_sort_stack
    data = [1, 5, 3, 20, 5, 8, 12, 4]
    stack = Stack.new
    data.each { |val| stack.push(val) }
    sort_stack(stack)
    assert_equal data.sort, stack.to_a
  end
end

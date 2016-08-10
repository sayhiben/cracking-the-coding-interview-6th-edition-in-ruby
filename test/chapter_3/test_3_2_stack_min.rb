require 'test_helper.rb'
require './lib/chapter_3/3_2_stack_min.rb'

class TestStackMin < Minitest::Test
  def setup
    @stack = Stack.new
  end

  def test_can_push
    @stack.push(5)
    assert_equal [5], @stack.to_a
  end

  def test_can_pop
    @stack.push(5)
    @stack.push(15)
    @stack.push(40)
    @stack.pop
    assert_equal [15, 5], @stack.to_a
  end

  def test_min
    @stack.push(5)
    @stack.push(15)
    @stack.push(40)
    @stack.push(3)
    @stack.push(35)
    assert_equal 3, @stack.min

    @stack.pop
    @stack.pop
    assert_equal 5, @stack.min
  end
end

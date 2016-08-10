require 'test_helper.rb'
require './lib/chapter_3/3_3_stack_of_plates.rb'

class TestStackOfPlates < Minitest::Test
  def setup
    @stack = SetOfStacks.new(3)
  end

  def test_push
    5.times { @stack.push('-') }
    assert_equal [%w(- - -), %w(- -)], @stack.stacks
  end

  def test_pop
    %w(a b c d e f).each { |val| @stack.push(val) }
    3.times { @stack.pop }
    assert_equal [%w(a b c)], @stack.stacks
    assert_equal 'c', @stack.pop
    2.times { @stack.pop }
    assert_equal [[]], @stack.stacks
  end

  def test_pop_at
    %w(a b c d e f).each { |val| @stack.push(val) }
    2.times { @stack.pop_at(0) }
    assert_equal [%w(a), %w(d e f)], @stack.stacks

    @stack.pop_at(0)
    assert_equal [%w(d e f)], @stack.stacks

    3.times { @stack.pop_at(0) }
    assert_equal [[]], @stack.stacks
  end
end

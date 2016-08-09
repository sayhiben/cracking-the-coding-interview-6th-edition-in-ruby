require 'test_helper.rb'
require './lib/chapter_3/3_1_three_in_one.rb'

class TestThreeInOne < Minitest::Test
  def setup
    @stacks = ArrayStacks.new
  end

  def test_can_instantiate
    assert_equal [nil, nil, nil], @stacks.array
  end

  def test_can_peek
    assert_equal nil, @stacks.peek(0)
    assert_equal nil, @stacks.peek(1)
    assert_equal nil, @stacks.peek(2)
  end

  def test_can_push
    @stacks.push(0, 'a')
    @stacks.push(1, 'b')
    @stacks.push(2, 'c')
    assert_equal 'a', @stacks.peek(0)
    assert_equal 'b', @stacks.peek(1)
    assert_equal 'c', @stacks.peek(2)
  end

  def test_can_push_multiple
    @stacks.push(0, 'a')
    @stacks.push(0, 'a2')
    @stacks.push(0, 'a3')
    @stacks.push(1, 'b')
    @stacks.push(2, 'c')
    @stacks.push(1, 'b2')
    assert_equal 'a3', @stacks.peek(0)
    assert_equal 'b2', @stacks.peek(1)
    assert_equal 'c', @stacks.peek(2)
    assert_equal ['a', 'a2', 'a3', nil, 'b', 'b2', 'c'], @stacks.array
  end

  def test_can_pop
    @stacks.push(0, 'a')
    @stacks.push(1, 'b')
    @stacks.push(2, 'c')
    assert_equal 'a', @stacks.pop(0)
    assert_equal [nil, 'b', 'c'], @stacks.array
  end

  def test_can_pop_multiple
    @stacks.push(0, 'a')
    @stacks.push(0, 'a2')
    @stacks.push(0, 'a3')
    @stacks.push(0, 'a4')
    @stacks.push(1, 'b')
    @stacks.push(2, 'c')
    @stacks.push(1, 'b2')
    @stacks.push(1, 'b3')
    @stacks.push(1, 'b4')
    @stacks.push(1, 'b5')

    @stacks.pop(0)
    @stacks.pop(1)
    @stacks.pop(1)
    @stacks.pop(0)
    @stacks.pop(1)
    @stacks.pop(1)
    @stacks.pop(0)
    assert_equal ['a', nil, 'b', nil, 'c'], @stacks.array
  end

end

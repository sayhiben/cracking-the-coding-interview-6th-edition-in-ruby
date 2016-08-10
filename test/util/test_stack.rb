require 'test_helper.rb'

class TestLinkedList < Minitest::Test
  def setup
    @stack = Stack.new
  end

  def test_push
    @stack.push('a')
    @stack.push('b')
    assert_equal %w(b a), @stack.to_a
  end

  def test_pop
    @stack.push('a')
    @stack.push('b')
    assert_equal 'b', @stack.pop
    assert_equal ['a'], @stack.to_a
  end

  def test_peek
    assert_nil @stack.peek
    @stack.push('a')
    assert_equal 'a', @stack.peek
    assert_equal ['a'], @stack.to_a
  end

  def test_empty?
    assert @stack.empty?
    @stack.push('a')
    assert !@stack.empty?
  end
end

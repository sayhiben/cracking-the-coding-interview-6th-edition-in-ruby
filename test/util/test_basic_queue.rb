require 'test_helper.rb'

class TestBasicQueue < Minitest::Test
  def setup
    @queue = BasicQueue.new
    @queue.enqueue('a')
    @queue.enqueue('b')
  end

  def test_enqueue
    assert_equal 'a', @queue.head.data
    assert_equal 'b', @queue.tail.data
  end

  def test_dequeue
    assert_equal 'a', @queue.dequeue
    assert_equal 'b', @queue.dequeue
    assert_nil @queue.dequeue
  end

  def test_peek
    assert_equal 'a', @queue.peek
    assert_equal 'a', @queue.peek
  end

  def test_empty?
    assert !@queue.empty?
    @queue.dequeue until @queue.dequeue.nil?
    assert @queue.empty?
  end
end

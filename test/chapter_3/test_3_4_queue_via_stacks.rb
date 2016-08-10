require 'test_helper.rb'
require './lib/chapter_3/3_4_queue_via_stacks.rb'

class TestQueueViaStacks < Minitest::Test
  def setup
    @queue = Queue.new
  end

  def test_enqueue
    ('a'..'z').each { |val| @queue.enqueue(val) }
    assert_equal ('a'..'z').to_a, @queue.to_a
  end

  def test_dequeue
    ('a'..'f').each { |val| @queue.enqueue(val) }
    assert_equal 'a', @queue.dequeue

    ('g'..'p').each { |val| @queue.enqueue(val) }
    5.times { @queue.dequeue }
    assert_equal 'g', @queue.dequeue
    assert_equal ('h'..'p').to_a, @queue.to_a
  end
end

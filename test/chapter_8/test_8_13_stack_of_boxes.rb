require 'test_helper.rb'
require './lib/chapter_8/8_13_stack_of_boxes.rb'

class TestStackOfBoxes < Minitest::Test

  class Box
    attr_accessor :height, :width, :depth
    def initialize(height, width, depth)
      @height = height
      @width = width
      @depth = depth
    end
  end

  def test_stack_of_boxes
    boxes = [
      Box.new(5, 5, 5),
      Box.new(1, 1, 4),
      Box.new(10, 6, 8),
      Box.new(2, 2, 10),
      Box.new(12, 14, 6)
    ]
    assert_equal 18, BoxStacker.new(boxes).max_stack
  end
end

# 8.13 Stack of Boxes
# You have a stack of n boxes, with widths w, heights h, and depths d. The boxes
#   cannot be rotated and can only be stacked on top of one another if each box
#   in the stack is strictly larger than the box above it in width, height, and
#   depth. Implement a method to compute the height of the tallest possible
#   stack. The height of a stack is the sum of the heights of each box.
#

class BoxStacker
  def initialize(boxes)
    @boxes = boxes
    @lookup = {}
  end

  def max_stack
    @boxes.each do |box|
      find_stack_height([box])
    end
    @lookup.max_by { |k, v| v }[1]
  end

  private

  def find_stack_height(current_stack)
    top_box = current_stack.last
    return @lookup[top_box] if @lookup.key?(top_box)
    smaller_boxes = @boxes.select do |box|
                      box.height < top_box.height &&
                      box.width < top_box.width &&
                      box.depth < top_box.depth
                    end
    max_height = 0
    smaller_boxes.each do |box|
      height = find_stack_height(current_stack + [box])
      max_height = [max_height, height].max
    end
    @lookup[top_box] = max_height + top_box.height
    @lookup[top_box]
  end
end

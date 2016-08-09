# 3.1 Three in one
# Describe how you could use a single array to implement three stacks.
#

# Discussion:
#   The naive approach is to initialize an array to some arbitrary size, divide
#   it into three parts, and manage each division as its own stack. Since ruby
#   arrays are dynamic, doing this would be both contrived and trivial.
#
#   An alternative is to begin with a small array and shift/resize it as items
#   are added and removed from each of the stacks. Shifting and resizing may be
#   expensive operations, and not all stacks will operate at the same speed -
#   resizing the first stack would require all of the elements in the second and
#   third to shift, whereas resizing the third stack could be done independently
#
#   Below is an implementation of this dynamically resizing array solution.
#

# ArrayStacks contains multiple stacks stored internally in one array
class ArrayStacks
  # These are exposed merely to make testing easier
  attr_accessor :array, :stacks

  STACK_COUNT = 3

  # StackInfo keeps track of each stack's indexes in the array
  class StackInfo
    attr_accessor :index_range, :head_offset
    def initialize
      @head_offset = 0
    end

    def size
      @index_range.size
    end

    def full?
      size == @head_offset
    end

    def empty?
      @head_offset == 0
    end

    def head_index
      @index_range.first + @head_offset
    end

    def last_index
      @index_range.last
    end
  end

  def initialize
    # Initialize an array with a stack length of 1 for each of the internal
    #   stacks
    @array = Array.new(STACK_COUNT)
    @stacks = Array.new(STACK_COUNT) { StackInfo.new }

    # Initialize the ranges in the array
    @stacks.each_with_index { |stack, i| stack.index_range = (i..i) }
  end

  def push(stack_index, data)
    stack = @stacks[stack_index]
    # If the stack is full, double its available size
    if stack.full?
      resize_stack(stack_index, stack.size * 2)
    end
    @array[stack.head_index] = data
    stack.head_offset += 1
  end

  def pop(stack_index)
    stack = @stacks[stack_index]
    return nil if stack.empty?
    stack.head_offset -= 1
    tmp = @array[stack.head_index]
    @array[stack.head_index] = nil
    # Shrink the stack's available size by half when it reaches a quarter of the
    #   previous size
    if stack.head_offset <= stack.size / 4 && stack.size >= 4
      resize_stack(stack_index, stack.size / 2)
    end
    tmp
  end

  def peek(stack_index)
    stack = @stacks[stack_index]
    @array[stack.head_index - 1]
  end

  private

  # Removes or inserts nil values in the array
  def resize_stack(stack_index, count)
    stack = @stacks[stack_index]
    return if count == stack.size
    diff = count - stack.size
    if diff.positive?
      diff.times { @array.insert(stack.head_index, nil) }
    else
      diff.abs.times { @array.delete_at(stack.head_index + 1) }
    end
    last = stack.index_range.last + diff
    stack.index_range = (stack.index_range.first..last)
    shift_stacks(stack_index, diff)
  end

  # Starting at the subsequent stack from the given index, shift the stack info
  #   left/right
  def shift_stacks(stack_index, count)
    @stacks.each_with_index do |stack, i|
      next unless i > stack_index
      first = stack.index_range.first + count
      last = stack.index_range.last + count
      stack.index_range = (first..last)
    end
  end
end

# 5.3 Flip bit to win
# You have an integer and you can flip exactly one bit from a 0 to a 1. Write
#   code to find the length of the longest sequence of 1s you could create.
#

# This solution keeps track of the count of 1's seen while shifting LSB's off
#   of num. When a 0 is encountered, the current count is saved to last_count
#   so that the current count + last count + 1 (for the bit we flip) can be
#   compared or assigned to the longest count.
#
def flip_bit_to_win(num)
  last_count = 0
  count = 0
  longest = 0
  until num.zero?
    if num & 1 == 0
      longest = [longest, count + last_count + 1].max
      last_count = count
      count = 0
    else
      count += 1
    end
    num >>= 1
  end
  longest = [longest, count + last_count + 1].max
  longest
end

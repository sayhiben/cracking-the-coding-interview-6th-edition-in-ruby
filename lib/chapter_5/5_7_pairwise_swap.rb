# 5.7 Pairwise Swap
# Write a program to swap odd and even bits in an integer with as few
#   instructions as possible (e.g., bit 0 and bit 1 are swapped, bit 2 and bit
#   3 are swapped, and so on).
#

# This solution saves all even bits and odd bits in separate variables by
#   combining them with a checkered mask. Each even/odd is then shifted and or'd
#   with one another
#
def pairwise_swap(num)
  mask = checkered_mask
  even = num & mask
  odd = num & (mask >> 1)
  (even >> 1) | (odd << 1)
end

def checkered_mask
  mask = 2
  16.times do
    mask <<= 2
    mask |= 2
  end
  mask
end

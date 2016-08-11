# 5.1 Insertion
# You are given two 32-bit numbers, N and Mm and two bit positions, i and j.
#   Write a method to insert M into N such that M starts at bit j and ends at
#   bit i. You can assume that the bits j through i have enough space to fit all
#   of M. That is, if M = 10011, you can assume that there are at least 5 bits
#   between j and i. You would not, for example, have j = 3 and i = 2, because
#   M could not fully fit between bit 3 and bit 2.
#

def bit_insert(n, m, i, j)
  # Start by creating a mask to clear out the bits in n between i and j
  mask = clearing_mask(i, j)

  # Then clear those bits in n
  n &= mask

  # Then, shift m by i bits so that the two numbers line up and logical-or them
  n | (m << i)
end

def clearing_mask(i, j)
  # First, create a mask that has all leading 1's until j
  mask = (-1 << (j+1))
  # Then, fill in the 1's up to i
  mask | (1 << i) - 1
end

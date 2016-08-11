# 5.4 Next Number
# Given a positive integer, print the next smallest and next largest number that
#   have the same number of 1 bits in their binary representation.
#

# Discussion:
#   While there is certainly a more optimal solution than this (trivial) brute
#   force approach, the kind of bit manipulation required feels more like trivia
#   than a solution that could reasonably be derived during a programming
#   interview. I feel that bit manipulation in ruby is rare enough that a brute
#   force answer should suffice.
#

def next_numbers(num)
  count = count_bits(num)
  next_largest = num + 1
  next_smallest = num - 1
  next_largest += 1 until count_bits(next_largest) == count
  next_smallest -= 1 until count_bits(next_smallest) == count
  "#{next_largest}, #{next_smallest}"
end

def count_bits(num)
  count = 0
  until num.zero?
    count += 1 if num & 1 > 0
    num >>= 1
  end
  count
end

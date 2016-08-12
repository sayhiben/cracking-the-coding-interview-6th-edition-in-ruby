# 8.3 Magic Index
# A magic index in an array A[0...n - 1] is defined to be an index such that
#   A[i] = i. Given a sorted array of distinct integers, write a method to find
#   a magic index, if one exists, in array A.
#

# This solution is just a binary search. It fails if there are duplicate
#   elements in the array, because it can no longer assume which side of the
#   magic index i is on
#
def magic_index(ary)
  find_magic_index(ary, ary.length/2, 0, ary.length - 1)
end

def find_magic_index(ary, i, min, max)
  return i if ary[i] == i
  max = i - 1 if ary[i] > i
  min = i + 1 if ary[i] < i
  find_magic_index(ary, min + (max - min) / 2, min, max)
end

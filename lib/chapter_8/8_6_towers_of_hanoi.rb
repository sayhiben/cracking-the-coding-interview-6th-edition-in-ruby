# 8.6 Towers of Hanoi
# In the classic problem of the Towers of Hanoi, you have 3 towers and N disks
#   of diffrerent sizes which can slide onto any tower. The puzzle starts with
#   disks sorted in ascending order of size from top to bottom (i.e., each disk
#   sits on top of an even larger one). You have the following constraints:
#
#   1. Only one disk can be moved at a time
#   2. A disk is slid off the top of one tower onto another tower
#   3. A disk cannot be placed on top of a smaller disk
#
#   Write a program to move the disks from the first tower to the last using
#   stacks.
#

# This runs in O(2^n) time
#
def towers_of_hanoi(towers)
  source = towers[0]
  dest = towers[1]
  temp = towers[2]
  n = towers[0].length
  shift_disks(n, source, dest, temp, towers)
  towers
end

def shift_disks(n, source, dest, temp, towers)
  return if n <= 0
  shift_disks(n - 1, source, temp, dest, towers)
  dest.push(source.pop)
  shift_disks(n - 1, temp, dest, source, towers)
end

# 8.8 Permutations with Dups
# Write a method to compute all permutations of a string whose characters are
#   not necessarily unique. The list of permutations should not have duplicates.
#

require './lib/chapter_8/8_7_permutations_without_dups.rb'

# This might be cheating, but we can just use the same algorithm from 8.7 and
#   call uniq on the result to clear out the duplicates.
#
def permutations_with_dups(str)
  permutations(str).uniq
end

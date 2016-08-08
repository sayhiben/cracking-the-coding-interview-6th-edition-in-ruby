# 1.3 URLify
# Write a method to replace all spaces in a string with '%20'. You may assume
#   that the string has sufficient space at the end to hold the additional
#   characters, and that you are given the "true" length of the string. Perform
#   this operation in place.

# This solution manipulates the string in reverse. It stops once all of the
#   "extra" spaces at the end of the provided string are exhausted.
#
# Time complexity: O(n)
# Space complexity: No additional space is needed, so O(1)
#
def urlify(str, true_length)
  i = str.length - 1
  j = true_length - 1
  while i > j
    # When a space is detected, use some of the extra spaces at the end of the
    #   string to insert '%20'.
    if str[j] == ' '
      str[(i - 2)..i] = '%20'
      i -= 3
    else
      str[i] = str[j]
      i -= 1
    end
    j -= 1
  end
  str
end
